variable "access_key" {
  description = "Access key to AWS console"
  sensitive   = true
}

variable "secret_key" {
  description = "Secret key to AWS console"
  sensitive   = true
}

variable "region" {
  description = "Region of AWS VPC"
}

variable "bucket_name" {
  description = "S3 Bucket Name"
}
