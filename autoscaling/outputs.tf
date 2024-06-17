output "launchtemplate" {
  value = aws_launch_template.testtemp.arn
}

output "autoscaling_group" {
  value = aws_autoscaling_group.testgroup.arn
}