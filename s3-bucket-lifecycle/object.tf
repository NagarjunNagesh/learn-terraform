# Upload an object
resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.bucket.id
  key    = "sample.txt"
  source = "files/sample.txt"
  etag   = md5("files/sample.txt")
} 