
resource "aws_iam_openid_connect_provider" "github" {
  url             = "https://token.actions.githubusercontent.com"
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"]
}

data "aws_iam_policy_document" "github_actions_assume_role" {
  version = "2008-10-17"
  statement {
    sid = null
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type = "Federated"
      identifiers = [
        aws_iam_openid_connect_provider.github.arn
        ]
    }

    # condition {
    #   test = "StringEquals"
    #   variable = "token.actions.githubusercontent.com:aud"
    #   values = ["sts.amazonaws.com"]
    # }

    condition {
      test = "StringLike"
      variable = "token.actions.githubusercontent.com:sud"
      values = [
        "repo:adamkielar/terraform-playground:*"
      ]
    }
  }
}

resource "aws_iam_role" "github_actions" {
  name = "github-actions"
  assume_role_policy = data.aws_iam_policy_document.github_actions_assume_role.json
  permissions_boundary = "arn:aws:iam::969598603422:policy/netguru-boundary"
}

data "aws_iam_policy_document" "github_actions" {
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

resource "aws_iam_policy" "github_actions" {
  name        = "github-actions"
  description = "Grant Github Actions the ability to check S3 bucket."
  policy      = data.aws_iam_policy_document.github_actions.json
}

resource "aws_iam_role_policy_attachment" "github_actions" {
  role       = aws_iam_role.github_actions.name
  policy_arn = aws_iam_policy.github_actions.arn
}

output "github-action-role" {
  value = aws_iam_role.github_actions.arn
}