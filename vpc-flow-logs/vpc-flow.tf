# Create a VPC Flow Logs
resource "aws_flow_log" "my_flow_log" {
  vpc_id                   = aws_vpc.vpc.id
  iam_role_arn             = aws_iam_role.VPCFlowLog_Role.arn
  traffic_type             = "ACCEPT"
  log_destination          = aws_cloudwatch_log_group.log.arn
  max_aggregation_interval = 60
}
