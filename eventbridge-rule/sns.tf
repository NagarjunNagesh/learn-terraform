############ Creating an SNS Topic ############
resource "aws_sns_topic" "topic" {
  name = "MyServerMonitor"
}


############ Creating SNS Topic Subscription ############
resource "aws_sns_topic_subscription" "topic-subscription" {
  topic_arn = aws_sns_topic.topic.arn
  protocol  = "email"
  endpoint  = var.endpoint
}
