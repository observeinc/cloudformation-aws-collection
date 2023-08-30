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

# Release Process

## Automated Release via GitHub Actions

The preferred method for releasing new versions of the CloudFormation templates is through the automated GitHub Actions workflow.

1. **Initiate the Release Workflow**: Go to the "Actions" tab in the GitHub repository and select the "Release" workflow. Then, click on "Run workflow" to manually start the release process. The action takes care of the rest: generating changelogs, uploading the CloudFormation templates to S3, and creating a GitHub release.

## Manual Release Using Make

If for any reason the GitHub Action workflow fails, you can manually release the templates using the `Makefile` provided in the repository:

1. **Set the Release Version**: Before starting, ensure you have an environment variable `RELEASE_VERSION` set with the desired release version. For instance, if you want to release version `v1.2.3`, you'd set:
   
   ```bash
   export RELEASE_VERSION=v1.2.3
   ```

2. **Run the Release**: Execute the `make release` command:

   ```bash
   make release
   ```

3. **Verify Templates on S3**: Ensure that the CloudFormation templates have been uploaded to the S3 bucket under both version-specific and `latest` paths.

4. **Create a GitHub Release**: Manually create a GitHub release, setting both the tag name and release name to the `RELEASE_VERSION` value. Make sure to include the changelog or relevant changes in the release description.

Remember: Ensure you have the necessary AWS credentials and permissions set up when manually executing the `Makefile` release process.
