resource "aws_instance" "instance_1" {
  depends_on = [
    aws_security_group.instances
  ]
  ami             = "ami-d74be5b8"
  instance_type   = "t2.micro"
  subnet_id = module.vpc.private_subnets[0]
  user_data       = <<-EOF
          #!bin/bash
          echo "Hello, World 1 > index.html
          python3 -m http.server 8000 &
          EOF
}

resource "aws_instance" "instance_2" {
  depends_on = [
    aws_security_group.instances
  ]
  ami             = "ami-d74be5b8"
  instance_type   = "t2.micro"
  subnet_id = module.vpc.private_subnets[0]
  user_data       = <<-EOF
          #!bin/bash
          echo "Hello, World 2 > index.html
          python3 -m http.server 8000 &
          EOF
}

module "s3_bucket" {
  source            = "terraform-aws-modules/s3-bucket/aws"
  version = "3.4.0"
  bucket            = format("devops-directive-web-app-data-%s", random_string.www_bucket.id)
  versioning = {
    enabled = true
  }
  force_destroy     = true

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

}

resource "random_string" "www_bucket" {
  length  = 7
  lower   = true
  upper   = false
  special = false
}

locals {
  region = "eu-central-1"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.16.1"

  name = "test-vpc"
  cidr = "11.0.0.0/16"
  create_vpc = true
  azs = [ "${local.region}a" ]
  private_subnets = ["11.0.1.0/24"]
  enable_vpn_gateway = true
  
}

resource "aws_security_group" "instances" {
  name = "instance-security-group"
  vpc_id = module.vpc.vpc_id
}