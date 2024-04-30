# Creating S3 Lifecycle Rule
resource "aws_s3_bucket_lifecycle_configuration" "rule" {
  bucket = aws_s3_bucket.bucket.id  
  rule {
    id = "transition-to-one-zone-ia"
    prefix = ""
    transition {
      days          = 30
      storage_class = "ONEZONE_IA"      
    }
    expiration {
      days = 120        
    }
    status = "Enabled"      
  } 
  rule {
    id = "transition-to-glacier"
    prefix = ""
    transition {
      days          = 90
      storage_class = "GLACIER"     
    }
    expiration {
      days = 120        
    }
    status = "Enabled"      
  }         
}

