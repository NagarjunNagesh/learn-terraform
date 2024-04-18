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

variable "sns_subscription_email" {
  type        = string
  description = "Email endpoint for the SNS subscription"
}