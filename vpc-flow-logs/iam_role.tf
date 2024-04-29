
#################### Creating Instance Profile ######################

resource "aws_iam_instance_profile" "VPCFlowLog_profile" {
  name = "VPCFlowLog_Instance_profile"
  role = aws_iam_role.VPCFlowLog_Role.name
}

####################### Creating IAM Role for EC2 #######################

resource "aws_iam_role" "VPCFlowLog_Role" {
  name = "VPCFlowLog_Role"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "vpc-flow-logs.amazonaws.com"
            }
        }
    ]
}
EOF
}
