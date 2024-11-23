# Output for Backup Vault ARN
output "backup_vault_arn" {
  description = "AWS Backup Vault ARN"
  value       = aws_backup_vault.backup_vault.arn
}

# Output for Backup Plan ID
output "backup_plan_id" {
  description = "AWS Backup Plan ID"
  value       = aws_backup_plan.backup_plan.id
}

# Output for Backup Selection ID
output "backup_selection_id" {
  description = "AWS Backup Selection ID"
  value       = aws_backup_selection.backup_selection.id
}

# Output for IAM Role ARN for AWS Backup
output "backup_role_arn" {
  description = "IAM Role ARN for AWS Backup"
  value       = aws_iam_role.backup_role.arn
}

# Output for Backup Plan Rule Name
output "backup_plan_rule_name" {
  description = "Name of the backup plan rule"
  value       = [for r in aws_backup_plan.backup_plan.rule : r.rule_name]
}

# Output for Backup Plan Schedule (Cron Expression)
output "backup_plan_schedule" {
  description = "Cron schedule for the backup plan"
  value       = [for r in aws_backup_plan.backup_plan.rule : r.schedule]
}

# Output for Backup Plan Lifecycle Delete After
output "backup_plan_lifecycle_delete_after" {
  description = "Delete backups after the specified number of days"
  value       = [for r in aws_backup_plan.backup_plan.rule : r.lifecycle[0].delete_after]
}

# Output for Backup Vault Name
output "backup_vault_name" {
  description = "Name of the backup vault"
  value       = aws_backup_vault.backup_vault.name
}

# Output for Backup Vault Encryption
output "backup_vault_encryption" {
  description = "Encryption used for the backup vault"
  value       = aws_backup_vault.backup_vault.kms_key_arn

}

# Output for Backup Selection Resources (S3 Buckets)
output "backup_selection_resources" {
  description = "Resources selected for backup in the backup selection"
  value       = aws_backup_selection.backup_selection.resources
}

# Output for IAM Role Policy for AWS Backup
output "backup_role_policy" {
  description = "IAM role policy for the AWS Backup service"
  value       = aws_iam_role.backup_role.assume_role_policy
}
