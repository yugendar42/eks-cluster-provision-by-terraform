# ------------------>  Provider  <-------------------------#


variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS CLI profile to use for authentication (optional)"
  type        = string
  default     = "default"
}

# ------------------>  VPC VARIABLES  <-------------------------#

variable "vpc_cidr_block" {
  description = "Give the Ip range"
  type        = string
  default     = "10.0.0.0/16"
}

variable "mainVpc_enable_dns_support" {
  description = "Enable DNS support (true/false)"
  type        = bool
  default     = true

}


variable "mainVpc_enable_dns_hostnames" {
  description = "enable the dns true/false"
  type        = bool
  default     = true

}

variable "vpcpublicSubnet1" {
  description = "define the subnet1 ip range"
  type        = string
  default     = "10.0.1.0/24"

}

variable "vpcpublicSubnet2" {
  description = "define the subnet2 ip range"
  type        = string
  default     = "10.0.2.0/24"


}

variable "vpcAvailability_zone" {
  description = "select the availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]

}

#--------------> Security-Group Variables <------------------------#

variable "eks_node_sg_name" {
  description = "Name of the security group for the EKS node group."
  type        = string
  default     = "eks-nodes-sg"
}

variable "ssh_cidr_blocks" {
  description = "The list of CIDR blocks that are allowedto access EKS nodes over SSH (port 22)."
  type        = list(string)
  default     = ["0.0.0.0/0"] # Modify as needed to restrict SSH access
}

variable "eks_cluster_sg_name" {
  description = "Name of the security group for the EKS cluster."
  type        = string
  default     = "eks-cluster-sg"
}


#----------------->Iam-eks Variable <-----------------------------#

variable "eks_cluster_role_name" {
  description = "Give the Role Name"
  type        = string
  default     = "eks-cluster-role"

}

#----------------->Iam-node-group  Variable <--------------------#

variable "eks_node_group_role_name" {
  description = "Provide the node group role name"
  type        = string
  default     = "eks-node-group-role"

}


#-----------------> EKS Variables < ----------------------------#

variable "eks_cluster_name" {
  description = "provide the name of cluster"
  type        = string
  default     = "my-eks-cluster"

}

variable "eks_cluster_version" {
  type        = string
  description = "Kubernetes version for the EKS cluster"
  default     = "1.29" # Latest stable version

}

#-----------------> EKS Node Group Variables < ----------------------------#

variable "eks_node_group_name" {
  description = "Give the Compute Node group name"
  type        = string
  default     = "worker_node1"
}

# variable "eks_node_group_role_arn" {
#   type = string

# }

variable "desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "min_capacity" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "max_capacity" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 2
}

variable "instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
  default     = "t2.medium"
}

variable "ssh_key_name" {
  type        = string
  description = "The name of the EC2 SSH key pair"
  default     = "eks-wrkr1-key"
}


