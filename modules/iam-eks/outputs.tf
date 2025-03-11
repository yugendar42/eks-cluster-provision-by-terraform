output "eks_cluster_iam_role_name" {
  description = "IAM Role Name for EKS Cluster"
  value = aws_iam_role.eks_cluster_role.name
}

output "eks_cluster_arn" {
  description = "The ARN of the EKS cluster role."
  value       = aws_iam_role.eks_cluster_role.arn
}