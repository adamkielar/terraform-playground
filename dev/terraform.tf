terraform {
  backend "s3" {
    region = "eu-central-1"

    dynamodb_table       = "terraform-locks-2a085ee2c5"
    bucket               = "terraform-state-2a085ee2c5"
    workspace_key_prefix = "envs"
    key                  = "playground.tfstate"

    acl     = "bucket-owner-full-control"
    encrypt = true
  }
}