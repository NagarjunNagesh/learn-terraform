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

resource "aws_s3_bucket_public_access_block" "access_pub" {
  bucket              = aws_s3_bucket.bucket.id
  block_public_policy = false
}

# Upload an object
resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.bucket.id
  key    = "Testlabs.png"
  source = "image/Testlabs.png"
  etag   = md5("image/Testlabs.png")
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
        "s3:ListBucket",
        "s3:GetObject"
        ],
      "Resource": [
        "${aws_s3_bucket.bucket.arn}",
        "${aws_s3_bucket.bucket.arn}/${aws_s3_object.object.key}"
      ]
    }
  ]
}
EOF
}