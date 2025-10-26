output "vpc_id" {
  value = var.cloud_provider == "aws" ? aws_vpc.main[0].id : "${var.cloud_provider}-vpc-${var.environment}"
}