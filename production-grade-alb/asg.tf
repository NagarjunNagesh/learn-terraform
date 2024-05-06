module "autoscaling" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "7.4.1"

  create = terraform.workspace == local.DevelopmentEnvironment ? false : true

  name = "${local.Project}-asg"

  min_size         = 2
  max_size         = 6
  desired_capacity = 2

  # Launch template
  launch_template_name        = "${local.Project}-template"
  launch_template_description = "Launch template for ${local.Project}"
  update_default_version      = true

  image_id       = var.ami
  instance_type  = terraform.workspace == local.DevelopmentEnvironment ? "t3.micro" : "t3.large"
  instance_name  = "${local.Project}-instance"
  load_balancers = [alb.target_groups.id]

  health_check_type = "ELB"

  scaling_policies = {
    asg-policy = {
      policy_type = "TargetTrackingScaling"
      target_tracking_configuration = {
        predefined_metric_specification = {
          predefined_metric_type = "ASGAverageCPUUtilization"
          resource_label         = "${local.Project}-asg-policy"
        }
        target_value = 60.0
      }
    }
  }

  user_data = <<-EOF
       #!/bin/bash
       sudo su
        yum update -y
        yum install httpd -y
        systemctl start httpd
        systemctl enable httpd
        echo "<html><h1> Welcome to test server. Happy Learning from $(hostname -f)...</p> </h1></html>" >> /var/www/html/index.html
        EOF

  tags = {
    Environment = local.Environment
    Project     = local.Project
  }
}