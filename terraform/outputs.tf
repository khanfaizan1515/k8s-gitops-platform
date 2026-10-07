output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_version" {
  description = "EKS Kubernetes version"
  value       = module.eks.cluster_version
}

output "cluster_security_group_id" {
  description = "EKS cluster security group ID"
  value       = module.eks.cluster_primary_security_group_id
}

output "node_group_names" {
  description = "EKS managed node group names"
  value       = keys(module.eks.eks_managed_node_groups)
}

output "vpc_id" {
  description = "VPC used by EKS"
  value       = var.vpc_id
}

output "subnet_ids" {
  description = "Subnets used by EKS"
  value       = var.subnet_ids
}
