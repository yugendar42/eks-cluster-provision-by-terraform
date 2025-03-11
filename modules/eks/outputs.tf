output "eks_cluster_id" {
  value = aws_eks_cluster.my-eks-cluster.id
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.my-eks-cluster.endpoint
}

output "eks_cluster_certificate_authority" {
  value = aws_eks_cluster.my-eks-cluster.certificate_authority[0].data
}