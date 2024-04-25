resource "aws_instance" "web-server" {
  ami             = "ami-02e136e904f3da870"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.rds_sg.name}"]
  user_data       = <<-EOF
    #!/bin/bash
    sudo su
    yum update -y
    yum install mysql -y
    EOF
  tags = {
    Name = "whiz_instance"
  }
}