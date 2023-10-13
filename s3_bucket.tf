resource "aws_s3_bucket" "repo" {
  bucket = "apt-repo-test-${random_string.bucket_name.result}"
}

resource "random_string" "bucket_name" {
  length  = 16
  special = false
  upper   = false
}

resource "aws_s3_bucket_ownership_controls" "repo" {
  # Required for deb-s3 to work
  bucket = aws_s3_bucket.repo.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.repo.bucket
}
