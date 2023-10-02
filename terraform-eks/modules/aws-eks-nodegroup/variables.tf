#------EKS-NODE_GROUP_VARIABLES----------
variable "aws_eks_cluster_name" {
  
}
variable "aws_eks_node_group_name" {
    default = "devops_eks_node_group"
}

variable "aws_eks_node_group_subnet_ids" {
  
}

variable "aws_eks_node_group_tag" {
  
}

variable "aws_eks_node_group_iam_role" {
    default = "devops_eks_node_group_iam_role"
}