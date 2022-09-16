module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"

  cluster_name    = "${var.environment}-Sirius_Cluster"
  cluster_version = "1.22"

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true
  create_cni_ipv6_iam_policy = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    name           = "${var.environment}-Sirius_node"
    disk_size      = 50
    instance_types = ["t2.medium"]
  }

  eks_managed_node_groups = {
    green = {
      min_size     = 1
      max_size     = 2
      desired_size = 1

      instance_types = ["t2.medium"]
      capacity_type  = "SPOT"
      labels = {
        Environment = "${var.environment}"
      }

      update_config = {
        max_unavailable_percentage = 50 # or set `max_unavailable`
      }

    }

  }
}
 