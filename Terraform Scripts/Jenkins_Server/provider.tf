terraform {
  required_version = "~> 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket       = "cicd-endtoend-project"
    key          = "jenkins/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_dynamodb_table" "tf_lock" {
  name           = "terraform-state-lock"
  hash_key       = "LockID"
  read_capacity  = 3
  write_capacity = 3

  attribute {
    name = "LockID"
        type = "S"
  }

  tags = {
    Name = "Terraform Lock Table"
  }

  lifecycle {
    prevent_destroy = false
  }
}
