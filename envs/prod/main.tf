terraform {
  backend "s3" {
    bucket = "bannai-terraform-state"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "../../modules/vpc"

  environment = "prod"
  vpc_cidr    = "10.0.0.0/16"
  nat_count   = 2

  tags = {
    Environment = "prod"
  }
}