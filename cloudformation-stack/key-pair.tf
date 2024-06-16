############ Creating Key pair for EC2 ############
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "testkey" {
  key_name   = "test-key"
  public_key = tls_private_key.example.public_key_openssh
}