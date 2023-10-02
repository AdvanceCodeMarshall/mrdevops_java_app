#--------------EKS_CONFIG-----------------------------------------
devops_aws_eks_cluster_config = {
    "demo-cluster" = {
        aws_eks_cluster_name = "devops-cluster"
        aws_eks_subnet_ids = ["subnet-0c6265a3df91b7b61","subnet-0f9c4ff10c3526a4d","subnet-04919de8d00a175f3","subnet-080af72a4f9415d55"]
        aws_eks_cluster_tag = {"Name" =  "demo-cluster"}  
    }
}

#--------------EKS_NODE_GROUP_CONFIG------------------------------
devops_aws_eks_node_group_config = {
  "devops-node1" = {
        eks_cluster_name = "demo-cluster"
        node_group_name = "devops-node"
        nodes_iam_role = "devops_eks_node_group_iam_role"
        node_subnet_ids = ["subnet-0c6265a3df91b7b61","subnet-0f9c4ff10c3526a4d","subnet-04919de8d00a175f3","subnet-080af72a4f9415d55"]

        aws_eks_node_group_tag = {"Name" =  "devops-node1"} 
  }
}