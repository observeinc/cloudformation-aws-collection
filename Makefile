.PHONY: cloudformation
cloudformation:
	aws s3 cp templates/collection.yaml s3://observeinc/cloudformation/collection-`semtag final -s minor -o`.yaml
	aws s3 cp templates/config.yaml s3://observeinc/cloudformation/config-`semtag final -s minor -o`.yaml
	aws s3 cp templates/cwmetricsstream.yaml s3://observeinc/cloudformation/cwmetricsstream-`semtag final -s minor -o`.yaml
	aws s3 cp templates/quicksetup.yaml s3://observeinc/cloudformation/quicksetup-`semtag final -s minor -o`.yaml
	aws s3 cp templates/vpc.yaml s3://observeinc/cloudformation/vpc-`semtag final -s minor -o`.yaml

.PHONY: changelog
changelog:
	git-chglog -o CHANGELOG.md --next-tag `semtag final -s minor -o`

.PHONY: release
release: cloudformation
	semtag final -s minor
