provider "aws" {
  # The below command is only needed when you are using aws-cli with profile name as terraform.
  #   profile = "terraform"
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

# This is used to define the required stuff should be from hashicorp and locks the version.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.21"
    }
  }
}