############ Creating Security Group for EC2 ############
resource "aws_security_group" "web-server" {
    name        = "MyEc2server-SG"
    description = "Security for ec2 server to connect with RDS"
    ingress {
        from_port   = 22
        to_port     = 22
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