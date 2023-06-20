variable az-zone {
  description = "AZ zone to use for this network"
  type = string
}

variable vpc-id {
  description = "AWS VPC"
  type = string
}

variable public-bastion-subnet-cidr {
  description = "CIDR subnet for public bastion subnet"
  type = string
}

variable private-app-subnet-cidr {
  description = "CIDR subnet for private app subnet"
  type = string
}

variable private-db-subnet-cidr {
  description = "CIDR subnet for private db subnet"
  type = string
}

variable internet-gateway-id {
  description = "vpc internet gateway id"
  type = string
}
