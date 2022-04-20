output "cluster_endpoint" {
  description = "endpoint fpe EKS cluster plane"
  value = module.eks.cluster_endpoint
}

output "cluster_sg_id" {
  description = "SG ids attached to cluster control plane"
  value = module.eks.cluster_id
}

output "region" {
  description = "AWS region"
  value = var.region
}

output "cluster_name" {
  description = "Name of cluster"
  value = var.eks_cluster_name
}

output "config_map_aws_auth" {
  description = "A kubernetes configuration to authenticate to this EKS cluster."
  value       = module.eks.aws_auth_configmap_yaml
}