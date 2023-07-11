output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "us-east-1a-subnet-ids" {
  value = {
    public-bastion-subnet = module.us-east-1a-network.public-bastion-subnet-id
    private-app-subnet = module.us-east-1a-network.private-app-subnet-id
    private-db-subnet = module.us-east-1a-network.private-db-subnet-id
  }
}

output "us-east-1b-subnet-ids" {
  value = {
    public-bastion-subnet = module.us-east-1b-network.public-bastion-subnet-id
    private-app-subnet = module.us-east-1b-network.private-app-subnet-id
    private-db-subnet = module.us-east-1b-network.private-db-subnet-id
  }
}

output "us-east-1c-subnet-ids" {
  value = {
    public-bastion-subnet = module.us-east-1c-network.public-bastion-subnet-id
    private-app-subnet = module.us-east-1c-network.private-app-subnet-id
    private-db-subnet = module.us-east-1c-network.private-db-subnet-id
  }
}