aws_region         = "ap-south-1"
cluster_name       = "capstone-platform"
kubernetes_version = "1.36"

vpc_id = "vpc-07e4e805f1a3eaac3"

subnet_ids = [
  "subnet-0947ed36b8b337e57",
  "subnet-0f4307938812b78cd"
]

node_instance_type = "t3.small"
node_min_size      = 1
node_max_size      = 2
node_desired_size  = 1
