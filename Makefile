S3_CP_ARGS=aws s3 cp --acl public-read

.PHONY: cloudformation
cloudformation:
	$(S3_CP_ARGS) templates/collection.yaml s3://observeinc/cloudformation/collection-`semtag final -s minor -o`.yaml
	$(S3_CP_ARGS) templates/collection.yaml s3://observeinc/cloudformation/collection-latest.yaml
	$(S3_CP_ARGS) templates/config.yaml s3://observeinc/cloudformation/config-`semtag final -s minor -o`.yaml
	$(S3_CP_ARGS) templates/config.yaml s3://observeinc/cloudformation/config-latest.yaml
	$(S3_CP_ARGS) templates/cwmetricsstream.yaml s3://observeinc/cloudformation/cwmetricsstream-`semtag final -s minor -o`.yaml
	$(S3_CP_ARGS) templates/cwmetricsstream.yaml s3://observeinc/cloudformation/cwmetricsstream-latest.yaml
	$(S3_CP_ARGS) templates/quicksetup.yaml s3://observeinc/cloudformation/quicksetup-`semtag final -s minor -o`.yaml
	$(S3_CP_ARGS) templates/quicksetup.yaml s3://observeinc/cloudformation/quicksetup-latest.yaml
	$(S3_CP_ARGS) templates/vpc.yaml s3://observeinc/cloudformation/vpc-`semtag final -s minor -o`.yaml
	$(S3_CP_ARGS) templates/vpc.yaml s3://observeinc/cloudformation/vpc-latest.yaml
	$(S3_CP_ARGS) templates/controltower.yaml s3://observeinc/cloudformation/controltower-`semtag final -s minor -o`.yaml
	$(S3_CP_ARGS) templates/controltower.yaml s3://observeinc/cloudformation/controltower-latest.yaml

.PHONY: changelog
changelog:
	git-chglog -o CHANGELOG.md --next-tag `semtag final -s minor -o`

.PHONY: release
release: cloudformation
	semtag final -s minor
