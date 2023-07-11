provider "aws" {
  region = var.region
}

resource "aws_ecr_repository" "ecr_repository" {
  name                 = "${var.namespace}-ecr-repo"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}