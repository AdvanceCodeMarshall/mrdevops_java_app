#-----------EKS-OUTPUT------------
output "eks_cluster_name" {
    value = aws_eks_cluster.devops_eks_cluster.name
}