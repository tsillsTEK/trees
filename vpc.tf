module "vpc" {
  source  = "registry.terraform.io/terraform-aws-modules/vpc/aws"
  version  = "3.11.3"

  name  = "tree_vpc"
  cidr = var.vpc_cidr
  azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    "kubernetes.io/cluster/tree_cluster" = "shared"
    "kubernetes.io/role/elb" = "1"
  }
  private_subnet_tags = {
    "kubernetes.io/cluster/tree_cluster" = "shared"
    "kubernetes.io/role/internal-elb" = "1"
  }
}

