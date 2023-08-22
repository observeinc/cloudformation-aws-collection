S3_CP_ARGS=aws s3 cp --acl public-read
RELEASE_VERSION?=

S3_BUCKET_PATH=s3://observe/cloudformation/
S3_EXISTING_VERSIONS=$(shell aws s3 ls $(S3_BUCKET_PATH) | grep $(RELEASE_VERSION) | wc -l)

.PHONY: cloudformation
cloudformation:
	for file in templates/*.yaml ; do \
		$(S3_CP_ARGS) $$file $(S3_BUCKET_PATH)`basename $$file .yaml`-$(RELEASE_VERSION).yaml ; \
		$(S3_CP_ARGS) $$file $(S3_BUCKET_PATH)`basename $$file .yaml`-latest.yaml ; \
	done

.PHONY: release
release: check_release_version check_existing_version cloudformation

check_release_version:
ifndef RELEASE_VERSION
	$(error RELEASE_VERSION is not set or empty for release)
endif

check_existing_version:
ifneq ($(S3_EXISTING_VERSIONS),0)
	$(error A release with version $(RELEASE_VERSION) already exists in S3)
endif
