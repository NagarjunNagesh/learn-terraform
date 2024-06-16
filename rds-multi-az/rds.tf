############ Creating Amazon Aurora Cluster ############
resource "aws_rds_cluster" "aurorards" {
  cluster_identifier     = "myauroracluster"
  engine                 = "aurora-mysql"
  engine_version         = "5.7.mysql_aurora.2.12.0"
  database_name          = "MyDB"
  master_username        = "TestlabsAdmin"
  availability_zones     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  master_password        = "Testlabs123"
  vpc_security_group_ids = [aws_security_group.rds-server.id]
  storage_encrypted      = false
  skip_final_snapshot    = true
}

############ Launching Amazon Aurora DB Instance ############
resource "aws_rds_cluster_instance" "cluster_instances" {
  count               = 2
  identifier          = "muaurorainstance${count.index}"
  cluster_identifier  = aws_rds_cluster.aurorards.id
  publicly_accessible = true
  instance_class      = "db.t3.small"
  engine              = aws_rds_cluster.aurorards.engine
  engine_version      = "5.7.mysql_aurora.2.12.0"
}