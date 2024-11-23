variable "s3_bucket_name" {
  description = "Name of the S3 bucket to back up."
  type        = string
}

variable "backup_vault_name" {
  description = "Name of the backup valut."
  type        = string
}

variable "sns_topic_arn" {
  description = "SNS Topic ARN for notification."
  type        = string
}

variable "backup_lifecycle" {
  description = "Lifecycle configuration for backup."
  type        = map(string)
}

variable "s3_bucket_arn" {
  description = "The ARN of the S3 bucket to back up."
  type        = string
  default     = "arn:aws:s3:::my-aws-certificates-2024"
}