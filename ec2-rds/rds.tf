#Creating RDS Database Instance
resource "aws_db_instance" "myinstance" {
  engine                 = "mysql"
  identifier             = "mydatabaseinstance"
  allocated_storage      = 20
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  username               = "testuser"
  password               = "testpassword"
  parameter_group_name   = "default.mysql5.7"
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
  skip_final_snapshot    = true
  publicly_accessible    = true
}