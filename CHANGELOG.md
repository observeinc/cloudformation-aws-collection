# [0.14.0](https://github.com/observeinc/cloudformation-aws-collection/compare/v0.13.0...v0.14.0) (2023-09-18)


### Bug Fixes

* **terraform:** forgot to configure the backend ([#37](https://github.com/observeinc/cloudformation-aws-collection/issues/37)) ([d1faaf5](https://github.com/observeinc/cloudformation-aws-collection/commit/d1faaf53689add19aa039a84f920d98a0f534769))


### Features

* gha releases ([#35](https://github.com/observeinc/cloudformation-aws-collection/issues/35)) ([c4f14f1](https://github.com/observeinc/cloudformation-aws-collection/commit/c4f14f1261b62c321751fd3c6fa6c8a998ff49b2))
* remove sns/sqs from snapshot defaults ([#40](https://github.com/observeinc/cloudformation-aws-collection/issues/40)) ([f735644](https://github.com/observeinc/cloudformation-aws-collection/commit/f7356449bc5dd32d483e19f729c3bfe3066eb510))
* **spec-tests:** introduce aws spec tests ([#39](https://github.com/observeinc/cloudformation-aws-collection/issues/39)) ([ca54dda](https://github.com/observeinc/cloudformation-aws-collection/commit/ca54dda7bf4d581805cd0e8f6c081891a1dd3c67))



# [0.13.0](https://github.com/observeinc/cloudformation-aws-collection/compare/v0.12.0...v0.13.0) (2023-08-14)


### Bug Fixes

* **collection:** add organizations:List* back to snapshot ([#34](https://github.com/observeinc/cloudformation-aws-collection/issues/34)) ([6a900c5](https://github.com/observeinc/cloudformation-aws-collection/commit/6a900c501bbf4a9aa179a4ebaac417ea90a402ad))



# [0.12.0](https://github.com/observeinc/cloudformation-aws-collection/compare/v0.11.0...v0.12.0) (2023-08-02)


### Bug Fixes

* make sure lambda log group is successfully deleted on rollback ([#32](https://github.com/observeinc/cloudformation-aws-collection/issues/32)) ([e5b8b99](https://github.com/observeinc/cloudformation-aws-collection/commit/e5b8b99ace7e3b1d8507d5953f3fdf8e6d6e0aeb)), closes [#21](https://github.com/observeinc/cloudformation-aws-collection/issues/21) [#21](https://github.com/observeinc/cloudformation-aws-collection/issues/21)



# [0.11.0](https://github.com/observeinc/cloudformation-aws-collection/compare/v0.10.0...v0.11.0) (2023-07-28)


### Bug Fixes

* **default-services:** remove services from the default list refs: OB-21129 ([#27](https://github.com/observeinc/cloudformation-aws-collection/issues/27)) ([9856ea7](https://github.com/observeinc/cloudformation-aws-collection/commit/9856ea7f9bea88f6c96f9f778da5d3917aaccb96))



# [0.10.0](https://github.com/observeinc/cloudformation-aws-collection/compare/v0.9.0...v0.10.0) (2023-07-27)


### Bug Fixes

* **collection:** allow configuration of lambda log verbosity ([#29](https://github.com/observeinc/cloudformation-aws-collection/issues/29)) ([269db50](https://github.com/observeinc/cloudformation-aws-collection/commit/269db50e0641a510a26af8bbeff0a124dd22069c))
* **lambda:** bump timeout and memory size based on failure data ([841be86](https://github.com/observeinc/cloudformation-aws-collection/commit/841be865e9190c947aea19c8982541c6acade307))
* remove duplicate log subscription ([#25](https://github.com/observeinc/cloudformation-aws-collection/issues/25)) ([49ceddb](https://github.com/observeinc/cloudformation-aws-collection/commit/49ceddbaa85682eabb77c518b88785abda157d8b))



