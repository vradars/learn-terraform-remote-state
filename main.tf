provider "aws" {
  region = var.region
  profile = var.profile
}

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.project}-terraform-state-bucket"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  object_lock_configuration {
    object_lock_enabled = "Enabled"
  }
    tags = {
      Name = "S3 Remote Terraform State Store"
    }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "${var.project}-terraform-lock-table"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    "Name" = "State- Lock Table for ${var.project}"
  }
}