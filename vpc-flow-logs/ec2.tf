############ Launching an EC2 Instance ############
resource "aws_instance" "instance" {
  ami                         = "ami-02e136e904f3da870"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.ec2sg.id}"]
  subnet_id                   = aws_subnet.subnet.id
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.VPCFlowLog_profile.name
  key_name                    = aws_key_pair.test_key.key_name
  tags = {
    Name = "testlabsec2instance"
  }
  depends_on = [aws_security_group.ec2sg]
}

