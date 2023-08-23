S3_CP_ARGS=aws s3 cp --acl public-read
RELEASE_VERSION?=

S3_BUCKET_PATH=s3://obs-colin/cloudformation/

.PHONY: copy_s3
copy_s3:
	for file in templates/*.yaml ; do \
		$(S3_CP_ARGS) $$file $(S3_BUCKET_PATH)$$(basename $$file .yaml)-$(RELEASE_VERSION).yaml ; \
		$(S3_CP_ARGS) $$file $(S3_BUCKET_PATH)$$(basename $$file .yaml)-latest.yaml ; \
	done

.PHONY: release
release: check_release_version check_existing_version copy_s3

check_release_version:
ifndef RELEASE_VERSION
	$(error RELEASE_VERSION is not set or empty for release)
endif

check_existing_version:
	@status=$$(aws s3api head-object --bucket obs-colin --key cloudformation/$$(basename templates/*.yaml .yaml)-$(RELEASE_VERSION).yaml >/dev/null 2>&1 ; echo $$?); \
	if [ "$$status" = "0" ]; then \
		$(error A release with version $(RELEASE_VERSION) already exists in S3) \
	elif [ "$$status" != "254" ] && [ "$$status" != "0" ]; then \
		$(error API or credential error while checking existence in S3) \
	fi
