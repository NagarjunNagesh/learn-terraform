#################### Creating 4 IAM Users ######################        
resource "aws_iam_user" "user1" {
  name = "John"
  path = "/"
  tags = {
    tag-key = "Dev-Team"
  }
}
resource "aws_iam_user" "user2" {
  name = "Sarah"
  path = "/"
  tags = {
    tag-key = "Dev-Team"
  }
}
resource "aws_iam_user" "user3" {
  name = "Rita"
  path = "/"
  tags = {
    tag-key = "HR-Team"
  }
}
resource "aws_iam_user" "user4" {
  name = "Ted"
  path = "/"
  tags = {
    tag-key = "HR-Team"
  }
}