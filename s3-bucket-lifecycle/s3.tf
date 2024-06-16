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