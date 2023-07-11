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

variable "vpc-id" {
  type = string
}

variable "us-east-1a-subnet-ids" {
  type = object({
    public-bastion-subnet = string
    private-app-subnet = string
  })
}

variable "us-east-1b-subnet-ids" {
  type = object({
    public-bastion-subnet = string
    private-app-subnet = string
  })
}

variable "us-east-1c-subnet-ids" {
  type = object({
    public-bastion-subnet = string
    private-app-subnet = string
  })
}