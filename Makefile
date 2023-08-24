S3_CP_ARGS=aws s3 cp --acl public-read
RELEASE_VERSION?=
BUCKET_NAME=observe-chutchinson

S3_BUCKET_PATH=s3://$(BUCKET_NAME)/cloudformation/

.PHONY: copy_s3
copy_s3:
	for file in templates/*.yaml ; do \
		$(S3_CP_ARGS) $$file $(S3_BUCKET_PATH)$$(basename $$file .yaml)-$(RELEASE_VERSION).yaml ; \
		$(S3_CP_ARGS) $$file $(S3_BUCKET_PATH)$$(basename $$file .yaml)-latest.yaml ; \
	done

.PHONY: release
release: check_release_version copy_s3

check_release_version:
ifndef RELEASE_VERSION
	$(error RELEASE_VERSION is not set or empty for release)
endif
