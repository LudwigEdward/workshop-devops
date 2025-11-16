variable "tags" {
  type = map(string)
  default = {
    "Environment" = "Development"
    "Owner"       = "John Doe"
    "Project"     = "Networking Stack"
  }
}

variable "assume_role" {
  type = object({
    role_arn = string
    region   = string
  })
  default = {
    role_arn = "arn:aws:iam::150419829629:role/workshop-nov-role"
    region   = "us-east-1"
  }
}


variable "eks_cluster" {
  type = object({
    name                      = string
    version                   = string
    enabled_cluster_log_types = list(string)
    access_config = object({
      authentication_mode = string
    })
    node_group_name           = string
    node_group_capacity_type  = string
    node_group_instance_types = list(string)
    node_group_scaling_config = object({
      desired_size = number
      max_size     = number
      min_size     = number
    })
    node_group_update_config = object({
      max_unavailable = number
    })
  })
  default = {
    name                      = "workshop-nov-eks-cluster"
    version                   = "1.31"
    enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
    access_config = {
      authentication_mode = "API_AND_CONFIG_MAP"
    }
    node_group_name           = "workshop-nov-eks-cluster-node-group"
    node_group_capacity_type  = "ON_DEMAND"
    node_group_instance_types = ["t3.medium"]
    node_group_scaling_config = {
      desired_size = 2
      max_size     = 2
      min_size     = 2
    }
    node_group_update_config = {
      max_unavailable = 1
    }
  }
}


variable "ecr_repositories" {
  type = list(object({
    name                 = string
    image_tag_mutability = string
  }))
  default = [
    {
      name                 = "dvn-nov-workshop/production/frontend"
      image_tag_mutability = "MUTABLE"
    },
    {
      name                 = "dvn-nov-workshop/production/backend"
      image_tag_mutability = "MUTABLE"
    }
  ]
}
