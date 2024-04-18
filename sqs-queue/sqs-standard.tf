############ Creating Standard Queue ############
resource "aws_sqs_queue" "queue2" {
  name = "MyWhizQueue"
}