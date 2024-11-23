variable "backup_event_rule_name" {
  description = "Event rule to capture backup completion states"
  type        = string
  default     = "backup-completion-event"
}

variable "sns_topic_arn" {
  description = "The ARN of the SNS topic to send notifications"
  type        = string
}
