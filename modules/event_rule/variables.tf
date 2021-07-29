variable "create_rule" {
  description = "Whether to create the Cloudwatch event rule"
  type        = bool
  default     = true
}

variable "rule_name" {
  description = "A name for the event rule"
  type        = string
  default     = null
}

variable "name_prefix" {
  description = "A name prefix for the event rule"
  type        = string
  default     = null
}

variable "schedule_expression" {
  description = "The scheduling expression. For example, cron(0 20 * * ? *) or rate(5 minutes). At least one of schedule_expression or event_pattern is required."
  type        = string
  default     = null
}

variable "event_bus_name" {
  description = "The event bus to associate with this rule. If you omit this, the default event bus is used."
  type        = string
  default     = null
}

variable "event_pattern" {
  description = "The event pattern described a JSON object. At least one of schedule_expression or event_pattern is required."
  type        = string
  default     = null
}

variable "role_arn" {
  description = "The Amazon Resource Name (ARN) associated with the role that is used for target invocation."
  type        = string
  default     = null
}

variable "description" {
  description = "The description of the rule"
  type        = string
  default     = null
}

variable "is_enabled" {
  description = "Whether the rule should be enabled."
  type        = bool
  default     = true
}

variable "create_target" {
  description = "Whether to create the CloudWatch event rule target"
  type        = bool
  default     = true
}

variable "target_id" {
  description = "The unique target assignment ID. If missing, will generate a random, unique id."
  type        = string
  default     = null
}

variable "arn" {
  description = "The Amazon Resource Name (ARN) of the target."
  type        = string
  default     = null
}

variable "target_role_arn" {
  description = "The Amazon Resource Name (ARN) of the IAM role to be used for this target when the rule is triggered. Required if ecs_target is used."
  type        = string
  default     = null
}

variable "input" {
  description = "Valid JSON text passed to the target. Conflicts with input_path and input_transformer."
  type        = string
  default     = null
}

variable "input_path" {
  description = "The value of the JSONPath that is used for extracting part of the matched event when passing it to the target. Conflicts with input and input_transformer."
  type        = string
  default     = null
}

variable "run_command_targets" {
  description = "(Optional) Parameters used when you are using the rule to invoke Amazon EC2 Run Command. Maximum 5 allowed"
  type        = any
  default     = {}
}

variable "ecs_target" {
  description = "(Optional) Parameters used when you are using the rule to invoke Amazon ECS Task. . Maximum 1 allowed"
  type        = any
  default     = {}
}

variable "batch_target" {
  description = "(Optional) Parameters used when you are using the rule to invoke an Amazon Batch Job. Maximum 1 allowed"
  type        = any
  default     = {}
}

variable "kinesis_target" {
  description = "(Optional) Parameters used when you are using the rule to invoke an Amazon Kinesis Stream. Maximum 1 allowed"
  type        = any
  default     = {}
}

variable "sqs_target" {
  description = "(Optional) Parameters used when you are using the rule to invoke an Amazon SQS Queue. Maximum 1 allowed"
  type        = any
  default     = {}
}

variable "http_target" {
  description = "(Optional) Parameters used when you are using the rule to invoke an API Gateway REST endpoint. Maximum 1 allowed"
  type        = any
  default     = {}
}

variable "input_transformer" {
  description = "(Optional) Parameters used when you are providing a custom input to a target based on certain event data. Conflicts with input and input_path."
  type        = any
  default     = {}
}

variable "retry_policy" {
  description = "(Optional) Parameters used when you are providing retry policies. Maximum 1 allowed"
  type        = any
  default     = {}
}

variable "dead_letter_config" {
  description = "(Optional) Parameters used when you are providing a dead letter config. Maximum 1 allowed"
  type        = any
  default     = {}
}

variable "tags" {
  description = " A map of tags to assign to the resource."
  type        = map
  default     = {}
}
