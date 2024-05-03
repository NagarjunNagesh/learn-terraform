############ Creating a cloudformation stack ############
resource "aws_cloudformation_stack" "whizstack" {
  parameters = {
    DBName         = "MyDatabase"
    DBPassword     = "whizlabsdb123"
    DBRootPassword = "whizlabsdbroot123"
    DBUser         = "WhizlabsDBUser"
    InstanceType   = "t2.micro"
  }
  name          = "whiz-stack"
  template_body = file("LAMP_template.json")
}