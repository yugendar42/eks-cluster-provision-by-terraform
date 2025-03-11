variable "vpc_id" {
  type = string
}
variable "eks_node_sg_name" {
  description = "Name of the security group for the EKS node group."
  type        = string
}

variable "ssh_cidr_blocks" {
  description = "The list of CIDR blocks that are allowed SSH access to EKS nodes."
  type        = list(string)
}

variable "eks_cluster_sg_name" {
  description = "Name of the security group for the EKS cluster."
  type        = string
}

