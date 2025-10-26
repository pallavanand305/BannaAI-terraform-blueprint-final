terraform {
  backend "s3" {
    bucket = "bannai-terraform-state"
    key    = "stage/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "../../modules/vpc"

  environment = "stage"
  vpc_cidr    = "10.1.0.0/16"
  nat_count   = 1

  tags = {
    Environment = "stage"
  }
}