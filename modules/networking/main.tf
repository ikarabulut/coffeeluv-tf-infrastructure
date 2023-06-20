resource "aws_eip" "public_eip" {
}

resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc-id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet-gateway-id
  }

}

resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc-id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.public_subnet_nat.id
  }
}

resource "aws_nat_gateway" "public_subnet_nat" {
  allocation_id = aws_eip.public_eip.id
  subnet_id     = aws_subnet.public_bastion_subnet.id
}

resource "aws_route_table_association" "public_subnet_asso" {
 subnet_id      = aws_subnet.public_bastion_subnet.id
 route_table_id = aws_route_table.public_route_table.id
}

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

resource "aws_route_table_association" "private_app_route_assc" {
  subnet_id      = aws_subnet.private_app_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_subnet" "private_db_subnet" {
  vpc_id     = var.vpc-id
  availability_zone = var.az-zone
  cidr_block = var.private-db-subnet-cidr
}

resource "aws_route_table_association" "private_db_route_assc" {
  subnet_id      = aws_subnet.private_db_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}