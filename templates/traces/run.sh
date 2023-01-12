REGION=us-west-2
ACCOUNT_ID=ACCOUNT_ID #12 digit account id 
STREAM_NAME=otel-test-stream
KINESIS_STREAM_ARN="arn:aws:kinesis:${REGION:-'us-west-2'}:${ACCOUNT_ID}:stream/${STREAM_NAME}"
[[ -f TrustPolicy.json ]] || cat > TrustPolicy.json << _EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "kinesis.amazonaws.com"
      },
      "Action": "sts:AssumeRole",
      "Condition": {
        "StringEquals": {
          "aws:SourceAccount": "${ACCOUNT_ID}"
        },
        "ArnLike": {
          "aws:SourceArn": "arn:aws:mobiletargeting:region:${ACCOUNT_ID}:apps/applicationId"
        }
      }
    }
  ]
}
_EOF
[[ -f PermissionPolicy.json ]] || cat > PermissionPolicy.json << __EOF
{
    "Version": "2012-10-17",
    "Statement": {
        "Action": [
            "kinesis:PutRecords",
            "kinesis:DescribeStream"
        ],
        "Effect": "Allow",
        "Resource": [
            "${KINESIS_STREAM_ARN}"
        ]
    }
}
__EOF
aws iam create-role --role-name OTELEventStreamRole --assume-role-policy-document file://TrustPolicy.json
aws iam put-role-policy --role-name OTELEventStreamRole --policy-name OTELEventStreamPermissionsPolicy --policy-document file://PermissionPolicy.json

cat > config.yaml << ___EOF
# Test OpenTelemetry collector configuration. Not for production use.
exporters:
  logging:
    loglevel: "\${OTEL_LOG_LEVEL}"
  awskinesis:
    aws:
      stream_name: ${STREAM_NAME}
      region: ${REGION}
      role: arn:aws:iam:${REGION}:${ACCOUT_ID}:role/OTELEventStreamRole
      kinesis_endpoint: kinesis.amazonaws.com
processors:
  batch:
  memory_limiter:
    # 80% of maximum memory up to 2G
    limit_mib: 2048
    # 25% of limit up to 2G
    spike_limit_mib: 512
    check_interval: "2s"
receivers:
  otlp:
    protocols:
      grpc:
      http:
service:
  telemetry:
    logs:
      level: "\${OTEL_LOG_LEVEL}"
  pipelines:
    traces:
      receivers: [otlp]
      processors: [memory_limiter, batch]
      exporters: [logging, awskinesis]
___EOF

# Observe used 0.62.1 for opentelemetry-contrib
docker run -p 4317:4317 -p 4318:4318 \
    --env OTEL_LOG_LEVEL="info" \
    -v $(pwd -P)/config.yaml:/etc/otel-collector-config.yaml \
    otel/opentelemetry-collector-contrib \
    --config=/etc/otel-collector-config.yaml
