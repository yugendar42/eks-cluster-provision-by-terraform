resource "aws_eks_node_group" "eks_nodes" {
  cluster_name    = var.eks_cluster_id
  node_group_name = var.eks_node_group_name
  node_role_arn   = var.eks_node_group_role_arn
  subnet_ids      = [var.vpc_public_subnet1_id, var.vpc_public_subnet2_id]

  scaling_config {
    desired_size = var.desired_capacity
    min_size     = var.min_capacity
    max_size     = var.max_capacity
  }

  ami_type         = "AL2_x86_64"
  instance_types = [var.instance_type]

  remote_access {
    ec2_ssh_key               = var.ssh_key_name
    source_security_group_ids = [var.eks_node_sg_id]
  }

  # Attach IAM Instance Profile
  

}

