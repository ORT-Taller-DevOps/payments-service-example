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
      "subnet-0877da50b6315fc6c",
      "subnet-0dd41fa6bc2b58537",
      "subnet-05062a0788eb72ced",
      "subnet-0597daea5fe4ffd2d",
      "subnet-0edf0ff5dde54f446",
    ]
  }
}

resource "aws_ecr_repository" "ecr" {
  provider = aws.aws_provider
  name = "payments-service-example"
}