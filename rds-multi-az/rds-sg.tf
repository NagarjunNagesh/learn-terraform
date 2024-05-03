############ Creating Security Group for RDS ############
resource "aws_security_group" "rds-server" {
  name        = "rds-maz-SG-SG"
  description = "Security group for RDS Aurora"
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}