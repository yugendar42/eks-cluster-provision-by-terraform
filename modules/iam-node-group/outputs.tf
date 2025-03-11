output "eks_node_group_role_name" {
    description = "IAM Role Name for eks-node-group"
    value = aws_iam_role.eks_node_group_role.name
}

output "eks_node_group_role_arn" {
    description = "Attached policy arn's for eks node group"
    value = aws_iam_role.eks_node_group_role.arn
  
}
