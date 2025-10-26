provider "aws" {
  region                      = "us-east-1"
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_region_validation      = true
  skip_requesting_account_id  = true
}

module "vpc" {
  source = "../modules/vpc"

  environment    = "test"
  vpc_cidr       = "10.2.0.0/16"
  nat_count      = 1
  cloud_provider = "aws"

  tags = {
    Environment = "test"
  }
}