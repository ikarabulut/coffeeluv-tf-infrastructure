terraform {
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

resource "aws_vpc" "main_vpc" {
  cidr_block = "172.16.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main_vpc.id
}

module "us-east-1a-network" {
  source = "./modules/networking"
  az-zone = "us-east-1a"
  vpc-id = aws_vpc.main_vpc.id
  internet-gateway-id = aws_internet_gateway.gw.id
  public-bastion-subnet-cidr = "172.16.1.0/24"
  private-app-subnet-cidr = "172.16.4.0/24"
  private-db-subnet-cidr = "172.16.8.0/24"
}

module "us-east-1b-network" {
  source = "./modules/networking"
  az-zone = "us-east-1b"
  vpc-id = aws_vpc.main_vpc.id
  internet-gateway-id = aws_internet_gateway.gw.id
  public-bastion-subnet-cidr = "172.16.2.0/24"
  private-app-subnet-cidr = "172.16.5.0/24"
  private-db-subnet-cidr = "172.16.9.0/24"
}

module "us-east-1c-network" {
  source = "./modules/networking"
  az-zone = "us-east-1c"
  vpc-id = aws_vpc.main_vpc.id
  internet-gateway-id = aws_internet_gateway.gw.id
  public-bastion-subnet-cidr = "172.16.3.0/24"
  private-app-subnet-cidr = "172.16.6.0/24"
  private-db-subnet-cidr = "172.16.10.0/24"
}