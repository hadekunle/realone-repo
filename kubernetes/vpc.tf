provider "aws" {
  region = "us-east-1"
}

variable "vpc_cidr_block" {}
variable "private_subnet_cidr_blocks" {}
variable "public_subnet_cidr_blocks" {}

data "aws_availability_zones" "available" {}


module "appify-vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  #commented out to use latest 
#   version = "5.0.0"

  name            = "appify-vpc"
  cidr            = var.vpc_cidr_block
  private_subnets = var.private_subnet_cidr_blocks
  public_subnets  = var.public_subnet_cidr_blocks
  azs             = data.aws_availability_zones.available.names

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = {
    "kubernetes.io/cluster/appify-eks-cluster" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/appify-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                   = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/appify-eks-cluster" = "shared"
    "kubernetes.io/role/internal-elb"          = 1
  }

}
