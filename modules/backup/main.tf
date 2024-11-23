resource "aws_backup_vault" "backup_vault" {
  name = var.backup_vault_name
}

resource "aws_backup_plan" "backup_plan" {
  name = "s3-back-plan"
  rule {
    rule_name         = "daily-backup-rule"
    target_vault_name = aws_backup_vault.backup_vault.name
    schedule          = "cron(6 15 * * ? *)" # 6:15 PM UTC = 12:00 AM Nepal Time

    start_window      = 60
    completion_window = 120

    lifecycle {
      delete_after = var.backup_lifecycle["delete_after"]
    }
  }
}

resource "aws_backup_selection" "backup_selection" {
  name         = "s3-backup-selection"
  plan_id      = aws_backup_plan.backup_plan.id
  iam_role_arn = aws_iam_role.backup_role.arn
  resources    = [var.s3_bucket_arn]
}

# IAM Role for AWS Backup
resource "aws_iam_role" "backup_role" {
  name = "backup-service-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          Service = "backup.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "backup_policy_attachment" {
  role       = aws_iam_role.backup_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSBackupServiceRolePolicyForS3Backup"
}