output "sns_topic_arn" {
  description = "SNS topic ARN for backup notifications"
  value       = module.sns.sns_topic_arn
}

output "sns_subscription_arn" {
  description = "SNS subscription ARN for the email notification"
  value       = module.sns.sns_subscription_arn
}

output "backup_vault_arn" {
  description = "AWS Backup vault ARN"
  value       = module.backup.backup_vault_arn
}

output "backup_plan_id" {
  description = "AWS Backup plan ID"
  value       = module.backup.backup_plan_id
}

output "backup_selection_id" {
  description = "AWS Backup selection ID"
  value       = module.backup.backup_selection_id
}

output "backup_role_arn" {
  description = "IAM role ARN for AWS Backup"
  value       = module.backup.backup_role_arn
}

output "backup_plan_rule_name" {
  description = "Name of the backup plan rule"
  value       = module.backup.backup_plan_rule_name
}

output "backup_plan_schedule" {
  description = "Cron schedule for the backup plan"
  value       = module.backup.backup_plan_schedule
}

output "backup_plan_lifecycle_delete_after" {
  description = "Delete backups after the specified number of days"
  value       = module.backup.backup_plan_lifecycle_delete_after
}

output "backup_vault_name" {
  description = "Name of the backup vault"
  value       = module.backup.backup_vault_name
}

output "backup_vault_encryption" {
  description = "Encryption used for the backup vault"
  value       = module.backup.backup_vault_encryption
}

output "backup_selection_resources" {
  description = "Resources selected for backup in the backup selection"
  value       = module.backup.backup_selection_resources
}

output "backup_role_policy" {
  description = "IAM role policy for the AWS Backup service"
  value       = module.backup.backup_role_policy
}

output "eventbridge_rule_arn" {
  description = "EventBridge rule ARN for capturing backup status"
  value       = module.eventbridge.event_rule_arn
}

output "eventbridge_target_arn" {
  description = "EventBridge target ARN for forwarding backup events to SNS"
  value       = module.eventbridge.event_target_arn
}
