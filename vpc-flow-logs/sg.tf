# Create Security group for EC2
resource "aws_security_group" "ec2sg" {
  name        = "whiz_sg"
  description = "whizlabssecuritygroup"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "whiz_sg"
  }
}

############ Creating Key pair for EC2 ############
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "whiz_key" {
  key_name   = "MySSHKey"
  public_key = tls_private_key.example.public_key_openssh
}
