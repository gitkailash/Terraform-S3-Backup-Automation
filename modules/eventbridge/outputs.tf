# Output for CloudWatch Event Rule ARN
output "event_rule_arn" {
  description = "CloudWatch Event Rule ARN for capturing backup status"
  value       = aws_cloudwatch_event_rule.backup_event_rule.arn
}

# Output for CloudWatch Event Target ARN
output "event_target_arn" {
  description = "CloudWatch Event Target ARN for forwarding backup events to SNS"
  value       = aws_cloudwatch_event_target.backup_event_target.arn
}
