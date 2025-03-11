resource "aws_eks_cluster" "my-eks-cluster" {
  name    = var.eks_cluster_name
  role_arn = var.eks_cluster_role_arn
  version = var.eks_cluster_version

  access_config {
    authentication_mode = "API_AND_CONFIG_MAP"
  }

  vpc_config {
    subnet_ids         = [var.vpc_public_subnet1_id, var.vpc_public_subnet2_id]
    security_group_ids = [var.eks_sg_id]
  }
}

