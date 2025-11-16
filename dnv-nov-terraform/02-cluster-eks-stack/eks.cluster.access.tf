# Grant access to the IAM user to manage the EKS cluster
resource "aws_eks_access_entry" "admin_user" {
  cluster_name      = aws_eks_cluster.this.name
  principal_arn     = "arn:aws:iam::150419829629:user/workshop"
  kubernetes_groups = []
  type              = "STANDARD"

  depends_on = [aws_eks_cluster.this]
}

# Associate cluster admin policy to the user
resource "aws_eks_access_policy_association" "admin_user_policy" {
  cluster_name  = aws_eks_cluster.this.name
  principal_arn = "arn:aws:iam::150419829629:user/workshop"
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }

  depends_on = [aws_eks_access_entry.admin_user]
}

# Also grant access to the assumed role if needed
resource "aws_eks_access_entry" "admin_role" {
  cluster_name      = aws_eks_cluster.this.name
  principal_arn     = var.assume_role.role_arn
  kubernetes_groups = []
  type              = "STANDARD"

  depends_on = [aws_eks_cluster.this]
}

resource "aws_eks_access_policy_association" "admin_role_policy" {
  cluster_name  = aws_eks_cluster.this.name
  principal_arn = var.assume_role.role_arn
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }

  depends_on = [aws_eks_access_entry.admin_role]
}

