resource "aws_cloudwatch_event_rule" "backup_event_rule" {
  name        = var.backup_event_rule_name
  description = "Capture AWS Backup events"

  event_pattern = jsonencode({
    "source" : ["aws.backup"],
    "detail-type" : ["Backup Job State Change"]
  })
}

resource "aws_cloudwatch_event_target" "backup_event_target" {
  rule = aws_cloudwatch_event_rule.backup_event_rule.name
  arn  = var.sns_topic_arn

  input_transformer {
    input_paths = {
      state            = "$.detail.state"
      backup_vault     = "$.detail.backupVaultName"
      backup_vault_arn = "$.detail.backupVaultArn"
      backup_id        = "$.detail.backupJobId"
      timestamp        = "$.detail.creationDate"
    }

    input_template = <<EOT
      "The backup job with ID <backup_id> for plan <backup_vault_arn> in vault <backup_vault> has state <state> at <timestamp>."
    EOT
  }
}