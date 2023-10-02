module "devops_aws_eks_cluster" {

   source = "./modules/aws-eks"
  
   for_each = var.devops_aws_eks_cluster_config

    aws_eks_cluster_name            = each.value.aws_eks_cluster_name 
    aws_eks_subnet_ids              = each.value.aws_eks_subnet_ids
    aws_eks_cluster_tag             = each.value.aws_eks_cluster_tag
}

module "aws_eks_node_group" {

   source = "./modules/aws-eks-nodegroup"
  
   for_each = var.devops_aws_eks_node_group_config

    aws_eks_node_group_name         = each.value.aws_eks_node_group_name
    aws_eks_cluster_name            = module.devops_aws_eks_cluster[each.value.aws_eks_cluster_name].aws_eks_cluster_name
    aws_eks_node_group_subnet_ids   = each.value.aws_eks_node_group_subnet_ids
    aws_eks_node_group_iam_role     = each.value.aws_eks_node_group_iam_role
    aws_eks_node_group_tag          = each.value.aws_eks_node_group_tag
}