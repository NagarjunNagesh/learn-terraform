################## Launching EC2 Instance ##################
resource "aws_instance" "web-server" {
    ami             = "ami-01cc34ab2709337aa"
    instance_type   = "t2.micro"
    key_name        = aws_key_pair.whiz_key.key_name
    security_groups = ["${aws_security_group.web-server.name}"]
    user_data = <<-EOF
#!/bin/bash -ex 
yum install mysql -y    
    EOF
    tags = {
        Name = "MyRdsEc2server"     
    }           
}