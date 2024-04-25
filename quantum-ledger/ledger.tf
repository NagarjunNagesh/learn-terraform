############ Creating a Ledger ############

resource "aws_qldb_ledger" "ledger" {
  name                = "DMV"
  permissions_mode    = "ALLOW_ALL"
  deletion_protection = false
}

