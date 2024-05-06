############ Creating Security Group for EC2 & ELB ############
resource "aws_security_group" "web-server" {
  name        = "web-server"
  description = "Allow incoming HTTP Connections"
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
}

################## Creating 2 EC2 Instances ##################
resource "aws_instance" "web-server" {

  ami             = "ami-01cc34ab2709337aa"
  instance_type   = "t2.micro"
  count           = 2
  key_name        = "private-key"
  security_groups = ["${aws_security_group.web-server.name}"]
  user_data       = <<-EOF
       #!/bin/bash
       sudo su
        yum update -y
        yum install httpd -y
        systemctl start httpd
        systemctl enable httpd
        echo "<html><h1> Welcome to test server. Happy Learning from $(hostname -f)...</p> </h1></html>" >> /var/www/html/index.html
        EOF
  tags = {
    Name        = "instance-${count.index}"
    Environment = local.Environment
    Project     = local.Project
  }
}
