# Change Log

All notable changes to this project will be documented in this file.

<a name="unreleased"></a>
## [Unreleased]



<a name="v0.10.0"></a>
## [v0.10.0] - 2023-07-27

- fix(collection): allow configuration of lambda log verbosity ([#29](https://github.com/observeinc/cloudformation-aws-collection/issues/29))
- chore(readme): update description for InvokeSnapshotOnStartEnabled
- fix: remove duplicate log subscription ([#25](https://github.com/observeinc/cloudformation-aws-collection/issues/25))
- chore: run `cfn-lint` on templates ([#26](https://github.com/observeinc/cloudformation-aws-collection/issues/26))
- fix(lambda): bump timeout and memory size based on failure data


<a name="v0.9.0"></a>
## [v0.9.0] - 2023-05-25

- chore: update CHANGELOG
- feat(collection): allow configuration of lambda name ([#21](https://github.com/observeinc/cloudformation-aws-collection/issues/21))
- fix(collection): generate snapshot rule name ([#20](https://github.com/observeinc/cloudformation-aws-collection/issues/20))
- feat(controltower): capture config snapshot on subscribe ([#19](https://github.com/observeinc/cloudformation-aws-collection/issues/19))
- feat(controltower): allow configuration of logging verbosity ([#18](https://github.com/observeinc/cloudformation-aws-collection/issues/18))
- fix(controltower): default to unreserved concurrent executions ([#15](https://github.com/observeinc/cloudformation-aws-collection/issues/15))
- fix(controltower): rename SNS topic to match stack name ([#17](https://github.com/observeinc/cloudformation-aws-collection/issues/17))
- fix(controltower): manage lambda log group ([#16](https://github.com/observeinc/cloudformation-aws-collection/issues/16))
- feat(controltower): allow lambda to request delivery of config snapshot ([#14](https://github.com/observeinc/cloudformation-aws-collection/issues/14))
- chore: update changelog
- chore: Update Makefile and README for supporting control tower
- feat: Add Central Logging Control Tower CF

### 

* Lambda Accepts Event Snapshot Sigal for S3 Buckets and egresses related data to Observe collectors
* Create SNS +Policy for Lambda and S3 signals
* `LambdaS3ReadAny` for broad bucket access.
* Requires ManagedResourcePrefix from ControlTower Baseline


<a name="v0.8.0"></a>
## [v0.8.0] - 2023-04-19

- chore: update CHANGELOG
- fix: adjust bucket ownership to allow ACLs ([#12](https://github.com/observeinc/cloudformation-aws-collection/issues/12))
- feat: add Cloudwatch Metrics pull example ([#9](https://github.com/observeinc/cloudformation-aws-collection/issues/9))
- perf: exclude some cloudtrail events from eventbridge rules ([#10](https://github.com/observeinc/cloudformation-aws-collection/issues/10))
- chore: update changelog


<a name="v0.7.0"></a>
## [v0.7.0] - 2023-03-31

- feat: metric stream disable ([#8](https://github.com/observeinc/cloudformation-aws-collection/issues/8))
- feat: parameter to disable metric stream ([#8](https://github.com/observeinc/cloudformation-aws-collection/issues/8))


<a name="v0.6.0"></a>
## [v0.6.0] - 2023-03-13

- chore: update changelog
- feat: enable log delivery to S3 via canned ACL ([#7](https://github.com/observeinc/cloudformation-aws-collection/issues/7))


<a name="v0.5.0"></a>
## [v0.5.0] - 2023-02-13

- chore: update changelog
- fix: Add cloudformation:List to the default parameter value of EventBridgeSnapshotConfig.
- make: extra s3 args, add `--acl public-read` ([#5](https://github.com/observeinc/cloudformation-aws-collection/issues/5))
- chore: update changelog


<a name="v0.4.0"></a>
## [v0.4.0] - 2023-01-10

- fix: support empty param TrailHasExcludeManagementEventSources ([#4](https://github.com/observeinc/cloudformation-aws-collection/issues/4))
- feat: parameter to exclude kms/rds cloudtrail events ([#3](https://github.com/observeinc/cloudformation-aws-collection/issues/3))
- chore: fill in readme
- feat: add -latest.yaml manifests ([#2](https://github.com/observeinc/cloudformation-aws-collection/issues/2))


<a name="v0.3.0"></a>
## [v0.3.0] - 2022-10-19

- chore: update changelog
- fix: update manifests to latest version


<a name="v0.2.0"></a>
## [v0.2.0] - 2022-10-14

- chore: update changelog
- fix: add changelog config


<a name="v0.1.0"></a>
## v0.1.0 - 2022-10-14

- feat: initial version-able templates
- first commit


[Unreleased]: https://github.com/observeinc/cloudformation-aws-collection/compare/v0.10.0...HEAD
[v0.10.0]: https://github.com/observeinc/cloudformation-aws-collection/compare/v0.9.0...v0.10.0
[v0.9.0]: https://github.com/observeinc/cloudformation-aws-collection/compare/v0.8.0...v0.9.0
[v0.8.0]: https://github.com/observeinc/cloudformation-aws-collection/compare/v0.7.0...v0.8.0
[v0.7.0]: https://github.com/observeinc/cloudformation-aws-collection/compare/v0.6.0...v0.7.0
[v0.6.0]: https://github.com/observeinc/cloudformation-aws-collection/compare/v0.5.0...v0.6.0
[v0.5.0]: https://github.com/observeinc/cloudformation-aws-collection/compare/v0.4.0...v0.5.0
[v0.4.0]: https://github.com/observeinc/cloudformation-aws-collection/compare/v0.3.0...v0.4.0
[v0.3.0]: https://github.com/observeinc/cloudformation-aws-collection/compare/v0.2.0...v0.3.0
[v0.2.0]: https://github.com/observeinc/cloudformation-aws-collection/compare/v0.1.0...v0.2.0
