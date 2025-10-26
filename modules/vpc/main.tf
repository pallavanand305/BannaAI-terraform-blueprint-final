terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# AWS
resource "aws_vpc" "main" {
  count      = var.cloud_provider == "aws" ? 1 : 0
  cidr_block = var.vpc_cidr
  tags = merge(var.tags, {
    Name = "${var.environment}-vpc"
  })
}

# Azure (minimal)
resource "null_resource" "azure_placeholder" {
  count = var.cloud_provider == "azure" ? 1 : 0
  provisioner "local-exec" {
    command = "echo 'Azure VNet would be created here'"
  }
}

# GCP (minimal)
resource "null_resource" "gcp_placeholder" {
  count = var.cloud_provider == "gcp" ? 1 : 0
  provisioner "local-exec" {
    command = "echo 'GCP VPC would be created here'"
  }
}