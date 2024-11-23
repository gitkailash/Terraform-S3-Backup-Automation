variable "s3_bucket_name" {
  description = "The name of the S3 bucket to back up."
  type        = string
  default     = "my-aws-certificates-2024"
}

variable "backup_retention_days" {
  description = "Number of days to retain backups."
  type        = number
  default     = 1
}

variable "region" {
  description = "The AWS region to deploy resources in"
  default     = "us-east-1"
}

