resource "aws_iam_role" "eks_access_role" {
  name = "EKSAdminRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::990995086227:root" # Allow root account
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role" "eks_cluster_role" {
    name = var.eks_cluster_role_name
    assume_role_policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Sid    = "AllowEKSClusterAssumeRole"
          Principal = {
            Service = "eks.amazonaws.com"
          }
        },
      ]
    })
}

# resource "aws_iam_role_policy_attachment" "eks_admin_policy" {
#   role       = aws_iam_role.eks_access_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterAdminPolicy"
# }

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
    role = aws_iam_role.eks_cluster_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "eks_cluster_service_policy" {
    role       = aws_iam_role.eks_cluster_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}

resource "aws_iam_role_policy_attachment" "eks_service_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eks_cluster_role.name
}
