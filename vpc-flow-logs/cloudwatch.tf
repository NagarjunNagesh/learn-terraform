# Create CloudWatch Logs group
resource "aws_cloudwatch_log_group" "log" {
  name = "testvpclogs"
}
