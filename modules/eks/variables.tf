variable "eks_cluster_name" {
    description = "provide the name of cluster"
    type = string  
}

variable "eks_cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string  
}

variable "vpc_public_subnet1_id" {
  type = string
}

variable "vpc_public_subnet2_id" {
  type = string
}

variable "eks_cluster_role_arn" {
  type = string
}

variable "eks_sg_id" {
  type = string
}