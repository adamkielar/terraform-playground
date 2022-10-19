###################################################
#        Github Actions Oidc
###################################################
module "github-actions-oidc" {
  source = "../modules/github-actions-oidc"

  oidc_url        = var.oidc_url
  oidc_client_id  = var.oidc_client_id
  oidc_thumbprint = var.oidc_thumbprint
  role_name = var.role_name

  iam_role_permissions_boundary = var.iam_role_permissions_boundary
  project_repository_condition  = var.project_repository_condition
  policy_arns = [
    aws_iam_policy.gh-s3.arn,
    aws_iam_policy.gh-dynamodb.arn,
  ]
}

###################################################
#        Permissions for Github Actions
###################################################
data "aws_iam_policy_document" "gh-s3" {
  statement {

    effect = "Allow"
    actions = [
      "s3:PutObject",
      "s3:ListBucket",
      "s3:GetObject",
    ]

    resources = [
      "arn:aws:s3:::terraform-state-2a085ee2c5/*",
      "arn:aws:s3:::terraform-state-2a085ee2c5"
    ]
  }
}

resource "aws_iam_policy" "gh-s3" {
  name        = "github-actions-s3"
  description = "Grant Github Actions permissions to S3 bucket."
  policy      = data.aws_iam_policy_document.gh-s3.json
}

data "aws_iam_policy_document" "gh-dynamodb" {
  statement {
    sid = "SpecificTable"
    effect = "Allow"
    actions = [
      "dynamodb:GetItem",
      "dynamodb:PutItem",
    ]

    resources = [
      "arn:aws:dynamodb:*:*:table/terraform-locks-2a085ee2c5",
    ]
  }
}

resource "aws_iam_policy" "gh-dynamodb" {
  name        = "github-actions-dynamodb"
  description = "Grant Github Actions permissions to Dynamo DB."
  policy      = data.aws_iam_policy_document.gh-dynamodb.json
}