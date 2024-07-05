provider "aws" {
  region = "us-east-1"
  shared_credentials_files = ["/tmp/.aws/credentials"]
  profile = "default"
}

resource "aws_ecr_repository" "payments-service-example_repo" {
  name                 = "payments-service-example"
  image_tag_mutability = "MUTABLE"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }
}