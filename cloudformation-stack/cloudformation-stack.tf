############ Creating a cloudformation stack ############
resource "aws_cloudformation_stack" "teststack" {
  parameters = {
    DBName         = "MyDatabase"
    DBPassword     = "testlabsdb123"
    DBRootPassword = "testlabsdbroot123"
    DBUser         = "TestlabsDBUser"
    InstanceType   = "t2.micro"
  }
  name          = "test-stack"
  template_body = file("LAMP_template.json")
}