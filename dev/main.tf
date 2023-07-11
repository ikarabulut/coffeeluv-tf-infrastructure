terraform {
  backend "s3" {
    bucket         = "coffeeluv-tf-backend"
    key            = "dev/terraform.tfstate"
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


module network {
  source = "./network"
  namespace = var.namespace
  region = "us-east-1"
}

module compute {
  source = "./compute"
  namespace = var.namespace
  region = "us-east-1"
  vpc-id = module.network.vpc_id
  us-east-1a-subnet-ids = {
    public-bastion-subnet = module.network.us-east-1a-subnet-ids.public-bastion-subnet
    private-app-subnet = module.network.us-east-1a-subnet-ids.private-app-subnet
  }
  us-east-1b-subnet-ids = {
    public-bastion-subnet = module.network.us-east-1b-subnet-ids.public-bastion-subnet
    private-app-subnet = module.network.us-east-1b-subnet-ids.private-app-subnet
  }
  us-east-1c-subnet-ids = {
    public-bastion-subnet = module.network.us-east-1c-subnet-ids.public-bastion-subnet
    private-app-subnet = module.network.us-east-1c-subnet-ids.private-app-subnet
  }
}

module "ecr_repository" {
  source = "./repository"
  namespace = var.namespace
}