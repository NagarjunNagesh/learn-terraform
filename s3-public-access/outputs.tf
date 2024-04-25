output "s3-bucket-name" {
    value = aws_s3_bucket.bucket.id
}

output "s3-bucket-domain-name" {
    value = aws_s3_bucket.bucket.bucket_domain_name
}