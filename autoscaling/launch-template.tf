resource "aws_launch_template" "whiztemp" {
  name_prefix   = "whizLT"
  image_id      = "ami-02e136e904f3da870"
  instance_type = "t2.micro"            
}