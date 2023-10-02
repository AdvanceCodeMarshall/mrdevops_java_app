#-----------EKS-------------------------------------

resource "aws_eks_cluster" "devops_eks_cluster" {
    # Name of the cluster.
    name     = var.aws_eks_cluster_name

    # The Amazon Resource Name (ARN) of the IAM role that provides permissions for 
    # the Kubernetes control plane to make calls to AWS API operations on your behalf
    role_arn = aws_iam_role.devops_eks_cluster_iam_role.arn

    # Desired Kubernetes master version
    version = "1.24"
    
    vpc_config {
        # Indicates whether or not the Amazon EKS private API server endpoint is enabled
        endpoint_private_access = false

        # Indicates whether or not the Amazon EKS public API server endpoint is enabled
        endpoint_public_access = true

        subnet_ids = var.aws_eks_subnet_ids
    }

    # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
    # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
    depends_on = [
        aws_iam_role_policy_attachment.AmazonEKSClusterPolicy
    ]

    tags = var.aws_eks_cluster_tag
}



resource "aws_iam_role" "devops_eks_cluster_iam_role" {
  # The name of the role
  name = "devops_eks_cluster"

    # The policy that grants an entity permission to assume the role.
    # Used to access AWS resources that you might not normally have access to.
    # The role that Amazon EKS will use to create AWS resources for Kubernetes clusters
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.devops_eks_cluster_iam_role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly-EKS" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role = aws_iam_role.devops_eks_cluster_iam_role.name
}