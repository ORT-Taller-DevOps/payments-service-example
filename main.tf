provider "aws" {
  region = "us-east-1" # Replace with your desired AWS region
  shared_credentials_files = "/tmp/.aws/credentials"
  profile = "default"
}

resource "aws_ecr_repository" "my_ecr_repo" {
  name                 = "payments-service-example" # Replace with your desired repository name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}