# Observe AWS Collection CloudFormation Templates

This repository contains a set of CloudFormation templates for
assembling different methods of collecting data from AWS into
Observe. It is intended as both a starting point and as a reference.

The main template `collection.yaml` sets up the following forwarding methods:

- the Observe lambda
- an S3 bucket, subscribed to the aforementioned Lambda
- a Firehose stream

Given these egresses, we extract data from the following sources:

- Cloudwatch Metrics, via Firehose
- CloudTrail, via S3
- EventBridge, via Firehose
- AWS snapshot data, via Lambda

# Usage

When creating a CloudFormation stack, set the S3 URL to [`https://observeinc.s3-us-west-2.amazonaws.com/cloudformation/collection-latest.yaml`](https://observeinc.s3-us-west-2.amazonaws.com/cloudformation/collection-latest.yaml).

# Control Tower
When creating a CloudFormation for **control tower**, set the S3 URL to https://observeinc.s3-us-west-2.amazonaws.com/cloudformation/controltower-latest.yaml

For pinned template versions, see [the Observe Collection CF template change log](https://github.com/observeinc/cloudformation-aws-collection/blob/main/CHANGELOG.md) in GitHub.
