terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  alias      = "aws_provider"
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
  token      = var.aws_session_token
  region     = var.aws_region
}

resource "aws_eks_cluster" "eks" {
  provider = aws.aws_provider
  role_arn = var.role_arn
  name     = "AWSEKSCluster"
  vpc_config {
    subnet_ids = [
      "subnet-00472f5a3c442297d",
      "subnet-0a5de4b5eb1a44c74",
      "subnet-08d3a1aaa06749b4f",
      "subnet-0bf6ca46c41a0c9ad",
      "subnet-013d3ef8fbd090b6e",
    ]
  }
}

resource "aws_eks_node_group" "node_group" {
  provider        = aws.aws_provider
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "node_group"
  node_role_arn   = aws_eks_cluster.eks.role_arn
  subnet_ids      = aws_eks_cluster.eks.vpc_config[0].subnet_ids
  capacity_type   = "ON_DEMAND"
  instance_types  = ["t3.micro"]
  labels = {
    env = var.environment
  }
  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
  update_config {
    max_unavailable = 1
  }
}

resource "aws_ecr_repository" "ecr" {
  provider = aws.aws_provider
  name     = var.repository
}
