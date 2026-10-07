data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.26.0"

  name               = var.cluster_name
  kubernetes_version = var.kubernetes_version

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  control_plane_subnet_ids = var.subnet_ids

  endpoint_public_access = true

  cloudwatch_log_group_retention_in_days = 7

  enable_cluster_creator_admin_permissions = true

  addons = {
    coredns = {
      most_recent = true
    }

    kube-proxy = {
      most_recent = true
    }

    vpc-cni = {
      most_recent = true
    }

    eks-pod-identity-agent = {
      most_recent = true
    }
  }

  eks_managed_node_groups = {
    platform = {
      name = "platform-nodes"

      instance_types = [var.node_instance_type]

      min_size     = var.node_min_size
      max_size     = var.node_max_size
      desired_size = var.node_desired_size

      subnet_ids = var.subnet_ids

      capacity_type = "ON_DEMAND"

      disk_size = 20

      ami_type = "AL2023_x86_64_STANDARD"

      labels = {
        role        = "platform"
        environment = "capstone"
      }

      tags = {
        Name        = "capstone-platform-node"
        Environment = "capstone"
        ManagedBy   = "Terraform"
      }
    }
  }

  tags = {
    Project     = "Capstone-Project-5"
    Environment = "capstone"
    ManagedBy   = "Terraform"
  }
}
