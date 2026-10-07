variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "capstone-platform"
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.36"
}

variable "vpc_id" {
  description = "Existing VPC ID"
  type        = string
  default     = "vpc-07e4e805f1a3eaac3"
}

variable "subnet_ids" {
  description = "Subnet IDs for EKS"
  type        = list(string)
}

variable "node_instance_type" {
  description = "EKS worker node instance type"
  type        = string
  default     = "t3.small"
}

variable "node_min_size" {
  description = "Minimum worker nodes"
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Maximum worker nodes"
  type        = number
  default     = 2
}

variable "node_desired_size" {
  description = "Desired worker nodes"
  type        = number
  default     = 1
}
