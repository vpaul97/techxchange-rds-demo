terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.65"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Intentionally non-compliant: storage_encrypted = false violates the
# rds-storage-encrypted policy, so this workspace fails policy evaluation.
resource "aws_db_instance" "demo" {
  identifier                  = "techxchange-demo"
  engine                      = "postgres"
  instance_class              = "db.t3.micro"
  allocated_storage           = 20
  db_name                     = "demo"
  username                    = "demoadmin"
  manage_master_user_password = true
  storage_encrypted           = false
  skip_final_snapshot         = true
}
