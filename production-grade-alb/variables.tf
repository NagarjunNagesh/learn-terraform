variable "vpc_id" {
  type        = string
  description = "VPC ID of the ALB"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDS corresponding to the VPC"
  default     = ["subnet-abcde012", "subnet-bcde012a"]
}

variable "https_certificate_arn" {
  type        = string
  description = "The ARN of the HTTPS Certificate to attach to ALB"
}

variable "ami" {
  type        = string
  description = "The AMI to use for the EC2 instance"
  default     = ""
}

variable "region" {
  description = "Region of AWS Resources"
  default     = "eu-west-1"
}