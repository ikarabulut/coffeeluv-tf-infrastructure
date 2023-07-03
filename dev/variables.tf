variable namespace {
  description = "The namespace for the infrastructure"
  type = string
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
  type        = string
}
