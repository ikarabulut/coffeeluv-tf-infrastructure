variable namespace {
  description = "The namespace for the infrastructure"
  type = string
  default = "dev-coffeeluv-infra"
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
  type        = string
}