# Using Kinesis Exporter with opentelemetry-contrib

The `run.sh` provided here should get you started with an opentelemetry-contrib instance that cangt write to a kinesis stream.

Things you'll need:
* aws CLI access to some region
* A Kinesis Stream that exists
* Runs a docker container for opentelemety-contrib with your config

Things that happen:

* Creation of Trust Policy (TrustPolicy.json) to allow for access to kinesis stream service. Create-role
* creation of Permisison Policy (PermissionPolicy.json) for puting records on an existing stream
* a config.yaml will be created from the `run.sh [stream-name] [awsccount_id]` but requires some parameterization

# Connecting a kinesis firehose to observe 
You will need to attach your stream to a firehose with the observe account
https://github.com/observeinc/cloudformation-aws-kinesis-firehose

