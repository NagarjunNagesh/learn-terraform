####################  Create New IAM Group and add IAM User ######################
resource "aws_iam_group" "group1" {
  name = "DevTeam"
}

resource "aws_iam_group_membership" "member1" {
  name = "user1"
  users = [
    aws_iam_user.user1.name,
    aws_iam_user.user2.name,
  ]
  group = aws_iam_group.group1.name
}

resource "aws_iam_group" "group2" {
  name = "HRTeam"
}

resource "aws_iam_group_membership" "member2" {
  name = "user2"
  users = [
    aws_iam_user.user3.name,
    aws_iam_user.user4.name,
  ]
  group = aws_iam_group.group2.name
}