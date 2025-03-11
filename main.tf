terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "vpc" {
  source                       = "./modules/vpc"
  vpc_cidr_block               = var.vpc_cidr_block
  mainVpc_enable_dns_support   = var.mainVpc_enable_dns_support
  mainVpc_enable_dns_hostnames = var.mainVpc_enable_dns_hostnames
  vpcpublicSubnet1             = var.vpcpublicSubnet1
  vpcpublicSubnet2             = var.vpcpublicSubnet2
  vpcAvailability_zone         = var.vpcAvailability_zone

}


module "security-group" {
  source              = "./modules/security-group"
  vpc_id              = module.vpc.vpc_Id
  eks_node_sg_name    = var.eks_node_sg_name
  ssh_cidr_blocks     = var.ssh_cidr_blocks
  eks_cluster_sg_name = var.eks_cluster_sg_name

}

module "iam-eks" {
  source                = "./modules/iam-eks"
  eks_cluster_role_name = var.eks_cluster_role_name

}

module "iam-node-group" {
  source                   = "./modules/iam-node-group"
  eks_node_group_role_name = var.eks_node_group_role_name

}

module "eks" {
  source                = "./modules/eks"
  eks_cluster_name      = var.eks_cluster_name
  eks_cluster_version   = var.eks_cluster_version
  vpc_public_subnet1_id = module.vpc.public_subnet1_id
  vpc_public_subnet2_id = module.vpc.public_subnet2_id
  eks_cluster_role_arn  = module.iam-eks.eks_cluster_arn
  eks_sg_id             = module.security-group.eks_node_sg_id

}

module "node-group" {
  source                  = "./modules/node-group"
  eks_node_group_name     = var.eks_node_group_name
  desired_capacity        = var.desired_capacity
  min_capacity            = var.min_capacity
  max_capacity            = var.max_capacity
  instance_type           = var.instance_type
  eks_cluster_id          = module.eks.eks_cluster_id
  eks_node_group_role_arn = module.iam-node-group.eks_node_group_role_arn
  vpc_public_subnet1_id   = module.vpc.public_subnet1_id
  vpc_public_subnet2_id   = module.vpc.public_subnet2_id
  eks_node_sg_id          = module.security-group.eks_node_sg_id
  ssh_key_name            = var.ssh_key_name
}




