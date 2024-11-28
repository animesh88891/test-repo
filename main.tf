terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
#test
resource "aws_s3_bucket" "bucket_name" {
  bucket = "devops-tf-state-ls"
  lifecycle {
    prevent_destroy = true
  }
  tags = {
    "owner"   = "devsasops@animesh.in"
    "Bu"      = "devops"
  }
}

resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.bucket_name.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-state-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
 
    "owner"   = "devophgs@anim23esh.in"
    "Bu"      = "devops"
  }
}
