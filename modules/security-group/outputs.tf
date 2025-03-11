output "eks_node_sg_id" {
  description = "The ID of the EKS node security group."
  value       = aws_security_group.eks_node_grp_sg.id
}

output "eks_cluster_sg_id" {
  description = "The ID of the EKS cluster security group."
  value       = aws_security_group.eks_sg.id
}