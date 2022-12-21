### Generating Config

The Otel Config Has to be stored as an SSM parameter as rendered. (Env variable support incoming)

```yaml
OBSERVE_COLLECTOR=collector.observeinc.com
OBSERVE_CUSTOMER=(redacted)
OBSERVE_TOEKN=(redacted)
```

```yaml
---
extensions:
  health_check:
receivers:
  otlp:
    protocols:
      grpc:
        endpoint:
      http:
        endpoint:
  awsxray:
    endpoint: 0.0.0.0:2000
    transport: udp
processors:
  batch/traces:
    timeout: 1s
    send_batch_size: 50 batch/metrics:
    timeout: 60s
  resourcedetection:
    detectors: [env, ec2]
    timeout: 5s
    override: true
exporters:
  otlphttp:
    endpoint: "https://${OBSERVE_CUSTOMER}.${OBSERVE_COLLECTOR}:443/v1/otel"
    headers:
      authorization: "Bearer ${OBSERVE_TOKEN}"
    sending_queue:
      num_consumers: 100
      queue_size: 4
    retry_on_failure:
      enabled: true
service:
  extensions: [health_check]
  pipelines:
    traces:
      receivers: [otlp,awsxray]
      processors: [resourcedetection,batch/traces]
      exporters: [otlphttp]
```

- Create Parameter SSM Directly with Config…
- Create VPC (advanced) with 0 AZ gateway. (Cloudformation version of this [https://observe.atlassian.net/browse/OB-14812](https://observe.atlassian.net/browse/OB-14812) https://observe.atlassian.net/browse/OB-14809)
    - add internet gateway and attach to vpc
- Security Groups ( Create one)

| Rule | IP version | Type | Protocol | Port range | Destination |
| --- | --- | --- | --- | --- | --- |
| Inbound | N/A | N/A | N/A | N/A | N/A |
| Outbound | IPv4 | All Traffic | All | All | 0.0.0.0/0 |

```yaml
ClusterName=otel-cluster-test
Region=us-west-2
Subnets=...
SEC_GROUP=...
aws cloudformation create-stack --stack-name AOCECS-${ClusterName}-${Region} \
    --template-body file://./traces/aws-otel-ecs-fargate-deployment.yaml \
    --parameters ParameterKey=ClusterName,ParameterValue=${ClusterName} \
                 ParameterKey=SecurityGroups,ParameterValue=${SEC_GROUP} \
                 ParameterKey=Subnets,ParameterValue=${Subnets} \
    --capabilities CAPABILITY_NAMED_IAM \
    --region ${Region}
```

# Linking a VPC

…[WIP]
```
ClusterName=otel-cluster-test
Region=us-west-2
SEC_GROUP=...
SUBNETS=...
aws cloudformation create-stack --stack-name AOCECS-${ClusterName}-${Region}-vpclink \
    --template-body file://./traces/vpc-link.yaml \
    --parameters ParameterKey=LinkName,ParameterValue=${ClusterName}-${Region} \
    ParameterKey=VPCLinkName,ParameterValue=${Region}
    ParameterKey=VPCLinkSecurityGroup,ParameterValue=${SEC_GROUP} \
    ParameterKey=VPCLinkPrivateSubnet1,ParameterValue=${SUBNETS[0]} \
    ParameterKey=VPCLinkPrivateSubnet2,ParameterValue=${SUBNETS[1]} \
    --capabilities CAPABILITY_NAMED_IAM \
    --region ${Region}
```

## List of things still todo
- Linking VPC with routes. Doing this to a lambda workload is still not tested.
- Easier Rendering of the OTEL collector config
- Using Env variables or have better parameterization for Datastream tokens.
