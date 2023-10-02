#--------------EKS_CONFIG-----------------------------------------
devops_aws_eks_cluster_config = {
    "demo-cluster" = {
        aws_eks_cluster_name = "devops-cluster"
        aws_eks_subnet_ids = ["subnet-0e3fe6e4eb85e04b7","subnet-0aaecd89aac62d1f1","	subnet-099eee174c1826619"]
        aws_eks_cluster_tag = {"Name" =  "demo-cluster"}  
    }
}

#--------------EKS_NODE_GROUP_CONFIG------------------------------
devops_aws_eks_node_group_config = {
  "devops-node1" = {
        eks_cluster_name = "demo-cluster"
        node_group_name = "devops-node"
        nodes_iam_role = "devops_eks_node_group_iam_role"
        node_subnet_ids = ["subnet-0e3fe6e4eb85e04b7","subnet-0aaecd89aac62d1f1","	subnet-099eee174c1826619"]

        aws_eks_node_group_tag = {"Name" =  "devops-node1"} 
  }
}