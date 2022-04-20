module "eks" {
  source                          = "registry.terraform.io/terraform-aws-modules/eks/aws"
  cluster_name                    = var.eks_cluster_name
  cluster_version                 = "1.21"
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }

  subnet_ids = module.vpc.private_subnets
  vpc_id     = module.vpc.vpc_id

  eks_managed_node_group_defaults = {

    ami_type = "AL2_x86_64"
    disk_size = 20
    instance_types = [
      "t3.medium"
    ]
  }

  eks_managed_node_groups = {
#    blue  = {}
    maple = {
      min_size     = 1
      max_size     = 10
      desired_size = 1

#      instance_types = ["t2.large"]
      capacity_type  = var.capacity_type
      labels         = {
        Environment = "test"
        GithubRepo  = "terraform-aws-eks"
        GithubOrg   = "terraform-aws-modules"
      }
    }
    workers_additional_policies = [aws_iam_policy.worker_policy.arn]

  }
}
data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
