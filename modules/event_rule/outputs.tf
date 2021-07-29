output "id" {
  description = "ID of Cloudwatch event rule"
  value       = element(concat(aws_cloudwatch_event_rule.this.*.id, [""]), 0)
}

output "arn" {
  description = "ARN of Cloudwatch event rule"
  value       = element(concat(aws_cloudwatch_event_rule.this.*.arn, [""]), 0)
}