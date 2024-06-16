provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}


############ Creating a Random String ############
resource "random_string" "random" {
  length  = 6
  special = false
  upper   = false
}

############ Creating an S3 Bucket ############
resource "aws_s3_bucket" "bucket" {
  bucket        = "testbucket-${random_string.random.result}"
  force_destroy = true
}

############ Creating Bucket Public Access Block ############
resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


# Upload an object
resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.bucket.id
  key    = "testlabs_logo_58_32.png"
  source = "image/testlabs_logo_58_32.png"
  etag   = filemd5("image/testlabs_logo_58_32.png")
}


#Creating Bucket Policy
resource "aws_s3_bucket_policy" "public_read_access" {
  bucket = aws_s3_bucket.bucket.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "s3:list*",
        "s3:get*",
        "s3:putobject"
        ],
      "Resource": [
        "${aws_s3_bucket.bucket.arn}",
        "${aws_s3_bucket.bucket.arn}/*"
      ]
    }
  ]
}
EOF
}
