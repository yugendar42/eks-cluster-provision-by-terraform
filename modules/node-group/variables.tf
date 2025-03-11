variable "eks_node_group_name" {
  type = string
}
variable "desired_capacity" {
  type = number
}
variable "min_capacity" {
  type = number
}
variable "max_capacity" {
  type = number
}
variable "instance_type" {
  type = string
}

variable "vpc_public_subnet1_id" {
  type = string
}

variable "vpc_public_subnet2_id" {
  type = string
}

variable "eks_cluster_id" {
  type = string
}

variable "eks_node_group_role_arn" {
  type = string
}

variable "eks_node_sg_id" {
  type = string
}

variable "ssh_key_name" {
  type = string
}
