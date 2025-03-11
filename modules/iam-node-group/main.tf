resource "aws_iam_role" "eks_node_group_role" {
    name = var.eks_node_group_role_name
    assume_role_policy = jsonencode({
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": {
                    "Service": "ec2.amazonaws.com"
                },
                "Action": "sts:AssumeRole"
            }
        ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_node_group_policy1" {
    role = aws_iam_role.eks_node_group_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  
}

resource "aws_iam_role_policy_attachment" "eks_node_group_policy2" {
    role = aws_iam_role.eks_node_group_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  
}

resource "aws_iam_role_policy_attachment" "eks_node_group_policy3" {
    role = aws_iam_role.eks_node_group_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  
}

resource "aws_iam_role_policy_attachment" "eks_node_group_ssm_policy" {
  role       = aws_iam_role.eks_node_group_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}





