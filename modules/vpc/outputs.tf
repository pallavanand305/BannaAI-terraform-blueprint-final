output "vpc_id" {
  value = var.cloud_provider == "aws" ? aws_vpc.main[0].id : var.cloud_provider == "azure" ? azurerm_virtual_network.main[0].id : google_compute_network.main[0].id
}