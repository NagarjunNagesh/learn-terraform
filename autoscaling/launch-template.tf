resource "aws_launch_template" "testtemp" {
  name_prefix   = "testLT"
  image_id      = "ami-02e136e904f3da870"
  instance_type = "t2.micro"            
}