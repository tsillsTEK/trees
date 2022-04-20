variable "region" {
  default = "us-east-1"
  description = "AWS Region"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
  description = "AWS VPC cidr block"
}

variable "eks_cluster_name" {
  default = "tree_cluster"
  description = "Name of EKS cluster"
}

variable "capacity_type" {
  description = "Type of capacity associated with the EKS Node Group. Valid values: `ON_DEMAND`, `SPOT`"
  type        = string
  default     = "ON_DEMAND"
}
