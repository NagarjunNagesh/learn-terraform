
################## Launching EC2 Instance ##################
resource "aws_instance" "web-server" {
  ami             = "ami-01cc34ab2709337aa"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.test_key.key_name
  security_groups = ["${aws_security_group.web-server.name}"]
  tags = {
    Name = "MyEC2Server"
  }
}
