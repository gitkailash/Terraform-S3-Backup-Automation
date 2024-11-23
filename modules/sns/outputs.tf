# Output for SNS Topic ARN
output "sns_topic_arn" {
  description = "SNS Topic ARN for backup notifications"
  value       = aws_sns_topic.sns_topic.arn
}

# Output for SNS Subscription ARN
output "sns_subscription_arn" {
  description = "SNS Subscription ARN for the email notification"
  value       = aws_sns_topic_subscription.sns_email_subscription.id
}
