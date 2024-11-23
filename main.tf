terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.74.2"
    }
  }
}

provider "aws" {
  region = var.region
}


module "sns" {
  source     = "./modules/sns"
  topic_name = "s3-backup-notifications"
  email      = "me01kls@gmail.com" # Replace with your email
}

module "backup" {
  source            = "./modules/backup"
  s3_bucket_name    = var.s3_bucket_name
  backup_vault_name = "s3-backup-vault"
  sns_topic_arn     = module.sns.sns_topic_arn
  backup_lifecycle  = { delete_after = var.backup_retention_days }
}

module "eventbridge" {
  source        = "./modules/eventbridge"
  sns_topic_arn = module.sns.sns_topic_arn
}