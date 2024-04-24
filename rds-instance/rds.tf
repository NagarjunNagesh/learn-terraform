## Creating DB Subnet Group
resource "aws_db_subnet_group" "myrdsdb_subnet_group" {
  name       = "myrdsdb-subnet-group"
  subnet_ids = [
                data.aws_subnet.subnet1.id,
                data.aws_subnet.subnet2.id
                ]
  tags = {
    Name = "MyRDSDBSubnetGroup"
  }
}

# Creating RDS Database Instance
resource "aws_db_instance" "myinstance" {
  engine               = "mysql"
  identifier           = "mydatabaseinstance"
  allocated_storage    = 20
  engine_version       = "8.0"
  instance_class       = "db.t3.large"
  username             = "mydatabaseuser"
  password             = "mydatabasepassword"
  parameter_group_name = "default.mysql8.0"
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name  = aws_db_subnet_group.myrdsdb_subnet_group.name
  skip_final_snapshot  = true
  publicly_accessible  = true
}