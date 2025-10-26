# AWS
resource "aws_vpc" "main" {
  count      = var.cloud_provider == "aws" ? 1 : 0
  cidr_block = var.vpc_cidr
  tags = merge(var.tags, {
    Name = "${var.environment}-vpc"
  })
}

# Azure
resource "azurerm_resource_group" "main" {
  count    = var.cloud_provider == "azure" ? 1 : 0
  name     = "${var.environment}-rg"
  location = "East US"
}

resource "azurerm_virtual_network" "main" {
  count               = var.cloud_provider == "azure" ? 1 : 0
  name                = "${var.environment}-vnet"
  address_space       = [var.vpc_cidr]
  location            = azurerm_resource_group.main[0].location
  resource_group_name = azurerm_resource_group.main[0].name
}

# GCP
resource "google_compute_network" "main" {
  count = var.cloud_provider == "gcp" ? 1 : 0
  name  = "${var.environment}-vpc"
}