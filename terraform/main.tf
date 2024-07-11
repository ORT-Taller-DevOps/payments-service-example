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
      "subnet-006acb2fbb0acd7e1",
      "subnet-0ed49e46ae4107c5f",
      "subnet-0f2719fe3c3c6acd0",
      "subnet-0f9074a6290555974",
      "subnet-0ae7a7fc01e819c0e",
    ]
  }
}

resource "aws_ecr_repository" "ecr" {
  provider = aws.aws_provider
  name     = "payments-service-example"
}
