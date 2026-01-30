provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "eks_state_bucket" {
  bucket = "demo-terraform-eks-state-bucket-121212"
 
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "demo-terraform-eks-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}