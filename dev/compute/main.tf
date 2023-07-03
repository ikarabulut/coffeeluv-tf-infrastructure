terraform {
  backend "s3" {
    bucket         = "coffeeluv-tf-backend"
    key            = "dev/compute/terraform.tfstate"
    region         = "us-east-2"

    dynamodb_table = "coffeeluv-locks"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}
