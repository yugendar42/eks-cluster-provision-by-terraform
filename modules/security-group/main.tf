#---------------> Creating Security Group for EKS Cluster Level < ---------------------------#

resource "aws_security_group" "eks_sg" {
  name   = "eks-cluster-sg"
  vpc_id = var.vpc_id

  tags = {
    Name = var.eks_cluster_sg_name
  }
}

# Allow traffic from EKS Nodes to the EKS Cluster (Port 443)
resource "aws_security_group_rule" "eks_cluster_ingress_https" {
  security_group_id         = aws_security_group.eks_sg.id
  type                      = "ingress"
  protocol                  = "tcp"
  from_port                 = 443
  to_port                   = 443
  source_security_group_id  = aws_security_group.eks_node_grp_sg.id
  description               = "Allow HTTPS traffic from EKS nodes"
}

# Allow internal kubelet traffic (Port 10250)
resource "aws_security_group_rule" "eks_cluster_ingress_kubelet" {
  security_group_id = aws_security_group.eks_sg.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 10250
  to_port           = 10250
  cidr_blocks       = ["10.0.0.0/16"]  # Only allow from VPC CIDR
  description       = "Allow kubelet traffic from within the VPC"
}

# Allow all outbound traffic from EKS Cluster
resource "aws_security_group_rule" "eks_cluster_egress" {
  security_group_id = aws_security_group.eks_sg.id
  type              = "egress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 65535
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow all outbound traffic"
}


#---------------> Creating Security Group for Node Group < ---------------------------#

resource "aws_security_group" "eks_node_grp_sg" {
  name   = "eks-nodes-sg"
  vpc_id = var.vpc_id

  tags = {
      Name = var.eks_node_sg_name
  }
}

# Allow nodes to communicate with the cluster (Port 443)
resource "aws_security_group_rule" "eks_nodes_ingress_cluster" {
  security_group_id = aws_security_group.eks_node_grp_sg.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 443
  to_port           = 443
  source_security_group_id = aws_security_group.eks_sg.id
  description       = "Allow nodes to communicate with the EKS cluster"
}

# Allow SSH access to nodes using a private key
resource "aws_security_group_rule" "eks_nodes_ingress_ssh" {
  security_group_id = aws_security_group.eks_node_grp_sg.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_blocks       = var.ssh_cidr_blocks # Restrict access to trusted IPs
  description       = "Allow SSH access to EKS nodes from specific CIDR blocks"
}

# Allow all outbound traffic from nodes
resource "aws_security_group_rule" "eks_nodes_egress" {
  security_group_id = aws_security_group.eks_node_grp_sg.id
  type              = "egress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 65535
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow all outbound traffic from EKS nodes"
}
