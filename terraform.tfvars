# ------------------>  Provider VARIABLES  <-------------------------#


aws_region  = "us-east-1"
aws_profile = "default"

# ------------------>  VPC VARIABLES  <-------------------------#

vpc_cidr_block               = "10.0.0.0/16"
mainVpc_enable_dns_support   = true
mainVpc_enable_dns_hostnames = true
vpcpublicSubnet1             = "10.0.0.0/20"
vpcpublicSubnet2             = "10.0.16.0/20"
vpcAvailability_zone         = ["us-east-1a", "us-east-1b"]

#--------------> Security-Group Variables <---------------------#

eks_node_sg_name = "eks-nodes-sg"
ssh_cidr_blocks  = ["0.0.0.0/0"] # Modify as needed to restrict SSH access
#ssh_cidr_blocks                = ["203.0.113.0/24", "198.51.100.0/24"]  # Replace with actual trusted IP ranges
eks_cluster_sg_name = "eks-cluster-sg"

#----------------->Iam-eks Variable <-----------------------------#

eks_cluster_role_name = "eks-cluster-role"

#----------------->Iam-node-group  Variable <--------------------#

eks_node_group_role_name = "eks-node-group-role"

#-----------------> EKS Variables < ----------------------------#

eks_cluster_name    = "my-eks-cluster"
eks_cluster_version = "1.31"

#-----------> EKS Node Group Variables < -------------#

eks_node_group_name = "worker_node1"
desired_capacity    = 2
min_capacity        = 1
max_capacity        = 2
instance_type       = "t2.medium"
ssh_key_name        = "eks-wrkr1-key" # Give your aws existing key-pair name  / Create one Key-pair, provide here
