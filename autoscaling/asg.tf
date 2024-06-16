resource "aws_autoscaling_group" "testgroup" {
  name= "test-ASG1"
  availability_zones = ["us-east-1a","us-east-1b"]
  desired_capacity   = 2
  max_size           = 2
  min_size           = 2
  launch_template {
    id      = aws_launch_template.testtemp.id
    version = "$Latest"     
  }         
}