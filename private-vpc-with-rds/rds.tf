module "cluster" {
  source  = "terraform-aws-modules/rds-aurora/aws"

  name           = "test-aurora-db-postgres96"
  engine         = "aurora-postgresql"
  engine_version = "14.5"
  instance_class = "db.r6g.large"

  instances = {
    writer = {}
    reader = {}
  }

  autoscaling_enabled      = true
  autoscaling_min_capacity = 2
  autoscaling_max_capacity = 5

  vpc_id               = module.vpc.default_vpc_id
  db_subnet_group_name = "db-subnet-group"
  security_group_rules = {
    ex1_ingress = {
      cidr_blocks = module.vpc.private_subnets_cidr_blocks
    }
    ex1_ingress = {
      source_security_group_id = "sg-12345678"
    }
  }

  storage_encrypted   = true
  apply_immediately   = true
  monitoring_interval = 10

  enabled_cloudwatch_logs_exports = ["postgresql"]

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}