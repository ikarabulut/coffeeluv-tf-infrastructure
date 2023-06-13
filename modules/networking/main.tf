resource "aws_subnet" "public_bastion_subnet" {
  vpc_id     = var.vpc-id
  availability_zone = var.az-zone
  cidr_block = var.public-bastion-subnet-cidr
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_app_subnet" {
  vpc_id     = var.vpc-id
  availability_zone = var.az-zone
  cidr_block = var.private-app-subnet-cidr
}

resource "aws_subnet" "private_db_subnet" {
  vpc_id     = var.vpc-id
  availability_zone = var.az-zone
  cidr_block = var.private-db-subnet-cidr
}