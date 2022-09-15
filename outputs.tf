output "state_backend" {
  value = {
    "bucket"  = aws_s3_bucket.bucket.id
    "table"   = aws_dynamodb_table.terraform_lock.id
    "region"  = var.region
    "profile" = var.profile
  }
}