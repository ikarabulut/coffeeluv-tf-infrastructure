# Terraform Infrastructure for CoffeeLuv

This is a 3 tier network architecture hosted on AWS using Terraform. This example is built following [Build a network layout from scratch](https://www.manning.com/liveproject/build-a-network-layout-from-scratch)

### Techniques employed

- Build a VPC and subnets
- Build internet gateways and NAT gateways
- Edit security groups to allow basic connectivity
- Create and configure a route table
- Test the infrastructure connectivity

## To build locally

Requirements:

- Terraform
- AWS Account
- AWS CLI (configured to your desired account role)
