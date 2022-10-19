terraform {
  required_version = ">=1.0"

  required_providers {
    aws = ">= 4.0"

    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
  }
}