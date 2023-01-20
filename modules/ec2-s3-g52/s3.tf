#Creation of a S3 bucket
resource "aws_s3_bucket" "s3-g52" {
  bucket = "s3-g52"
  tags = {
    Name        = "s3-g52"
    Environment = "Prod"
  }
}

resource "aws_s3_bucket_policy" "security_group" {
  bucket = aws_s3_bucket.s3-g52.id
  policy = <<POLICY
  {
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DenyOnIPAddress",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": [
        "arn:aws:s3:::s3-g52/*"
      ],
      "Condition": {
         "NotIpAddress": {"aws:SourceIp": "10.10.1.0/24"}
      }
    }
  ]
}
POLICY
}

resource "aws_s3_bucket_public_access_block" "s3-g52" {
  bucket = aws_s3_bucket.s3-g52.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_acl" "security_group" {
  bucket = aws_s3_bucket.s3-g52.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_s3-g52" {
  bucket = aws_s3_bucket.s3-g52.id
  versioning_configuration {
    status = "Enabled"
  }
}
