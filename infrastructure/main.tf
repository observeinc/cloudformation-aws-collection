locals {
  organization = "hutchic-observe-meta"
  repository   = "cloudformation-aws-collection"
}

data "aws_iam_openid_connect_provider" "github_actions" {
  url = "https://token.actions.githubusercontent.com"
}

data "aws_s3_bucket" "cloudformation_bucket" {
  bucket = "observe-chutchinson"
}

locals {
  oidc_claim_prefix = trimprefix(data.aws_iam_openid_connect_provider.github_actions.url, "https://")
}

data "aws_iam_policy_document" "github_actions_assume_role" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [data.aws_iam_openid_connect_provider.github_actions.arn]
    }

    condition {
      test     = "StringLike"
      variable = "${local.oidc_claim_prefix}:sub"
      values = ["repo:${local.organization}/${local.repository}:*"]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.oidc_claim_prefix}:aud"
      values   = ["sts.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "bucket_write" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:PutObject",
    ]

    resources = [
      "${data.aws_s3_bucket.cloudformation_bucket.arn}/cloudformation/*"
    ]
  }

  statement {
    actions   = ["s3:ListBucket"]
    resources = [data.aws_s3_bucket.cloudformation_bucket.arn]
  }
}

resource "aws_iam_role" "github_actions_release" {
  name = "${local.repository}-gha-release"

  inline_policy {
    name   = "github-actions-s3-write"
    policy = data.aws_iam_policy_document.bucket_write.json
  }

  managed_policy_arns = []
  assume_role_policy  = data.aws_iam_policy_document.github_actions_assume_role.json

  tags = {
    Principal  = "GitHub Actions"
    Repository = "${local.organization}/${local.repository}"
  }
}

resource "github_actions_variable" "aws_release_role" {
  repository = "${local.repository}"

  variable_name = "AWS_ROLE_ARN"
  value         = aws_iam_role.github_actions_release.arn
}
