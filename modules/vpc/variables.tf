variable "environment" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "nat_count" {
  type    = number
  default = 1
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "cloud_provider" {
  type    = string
  default = "aws"
}