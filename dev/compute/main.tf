provider "aws" {
  region = var.region
}

resource "tls_private_key" "tls_connector" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "myKeyPair" {
  key_name   = "myLabKeyPair"
  public_key = tls_private_key.tls_connector.public_key_openssh
}

resource "local_file" "myLabKeyPairFile" {
    content     = tls_private_key.tls_connector.private_key_pem
    filename    = "myLabKeyPair.pem"
}

module "us_east_1a_instances" {
  source = "git@github.com:ikarabulut-terraform-registry/terraform-aws-3tiercompute.git?ref=v0.2.0"
  public-subnet-id = var.us-east-1a-subnet-ids.public-bastion-subnet
  private-subnet-id = var.us-east-1a-subnet-ids.private-app-subnet
  key-name = aws_key_pair.myKeyPair.key_name
  bastion-sg-id = aws_security_group.BastionSG.id
  app-sg-id = aws_security_group.AppSG.id
}

module "us_east_1b_instances" {
  source = "git@github.com:ikarabulut-terraform-registry/terraform-aws-3tiercompute.git?ref=v0.2.0"
  public-subnet-id = var.us-east-1b-subnet-ids.public-bastion-subnet
  private-subnet-id = var.us-east-1b-subnet-ids.private-app-subnet
  key-name = aws_key_pair.myKeyPair.key_name
  bastion-sg-id = aws_security_group.BastionSG.id
  app-sg-id = aws_security_group.AppSG.id
}

module "us_east_1c_instances" {
  source = "git@github.com:ikarabulut-terraform-registry/terraform-aws-3tiercompute.git?ref=v0.2.0"
  public-subnet-id = var.us-east-1c-subnet-ids.public-bastion-subnet
  private-subnet-id = var.us-east-1c-subnet-ids.private-app-subnet
  key-name = aws_key_pair.myKeyPair.key_name
  bastion-sg-id = aws_security_group.BastionSG.id
  app-sg-id = aws_security_group.AppSG.id
}

resource "aws_security_group" "BastionSG" {
    name        = "BastionSG"
    description = "Allow ssh"
    vpc_id      = var.vpc-id
    
    ingress {
        from_port   = "22"
        to_port     = "22"
        protocol    = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "AppSG" {
    name        = "AppSG"
    description = "Allow ssh"
    vpc_id      = var.vpc-id
    
    ingress {
        from_port   = "22"
        to_port     = "22"
        protocol    = "TCP"
        security_groups = [aws_security_group.BastionSG.id]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}