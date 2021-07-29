resource "aws_cloudwatch_event_rule" "this" {
  count = var.create_rule ? 1 : 0

  name        = var.rule_name
  name_prefix = var.name_prefix

  schedule_expression = var.schedule_expression
  event_bus_name      = var.event_bus_name
  event_pattern       = var.event_pattern

  role_arn    = var.role_arn
  description = var.description
  is_enabled  = var.is_enabled

  tags = var.tags
}

resource "aws_cloudwatch_event_target" "this" {
  count = var.create_target ? 1 : 0

  rule = var.create_rule ? aws_cloudwatch_event_rule.this[0].name : var.rule_name

  event_bus_name  = var.event_bus_name
  target_id       = var.target_id
  arn             = var.arn

  input       = var.input
  input_path  = var.input_path
  role_arn    = var.target_role_arn

  dynamic "run_command_targets" {
    for_each = length(keys(var.run_command_targets)) == 0 ? [] : [var.run_command_targets]
    iterator = r

    content {
      key = r.value.key
      values = r.value.values
    }
  }

  dynamic "ecs_target" {
    for_each = length(keys(var.ecs_target)) == 0 ? [] : [var.ecs_target]
    iterator = e

    content {
      dynamic "network_configuration" {
        for_each = length(keys(lookup(e.value, "network_configuration", {}))) == 0 ? [] : [lookup(e.value, "network_configuration", {})]
        iterator = n

        content {
          subnets = n.value["subnets"]
          security_groups = lookup(n.value, "security_groups", null) 
          assign_public_ip = lookup(n.value, "assign_public_ip", false)
        }
      }
      group = lookup(e.value, "group", null)
      launch_type = lookup(e.value, "launch_type", null)
      platform_version = lookup(e.value, "platform_version", null)
      task_count = lookup(e.value, "task_count", null)
      task_definition_arn = e.value["task_definition_arn"]
    }
  } 

  dynamic "batch_target" {
    for_each = length(keys(var.batch_target)) == 0 ? [] : [var.batch_target]
    iterator = b

    content {
      job_definition = b.value["job_definition"]
      job_name       = b.value["job_name"]
      array_size     = lookup(b.value, "array_size", null)
      job_attempts   = lookup(b.value, "job_attempts", null)
    }
  }

  dynamic "kinesis_target" {
    for_each = length(keys(var.kinesis_target)) == 0 ? [] : [var.kinesis_target]
    
    content {
      partition_key_path = lookup(kinesis_target.value, "partition_key_path", null)
    }
  } 

  dynamic "sqs_target" {
    for_each = length(keys(var.sqs_target)) == 0 ? [] : [var.sqs_target]

    content {
      message_group_id = lookup(sqs_target.value, "message_group_id", null)
    }
  }

  dynamic "http_target" {
    for_each = length(keys(var.http_target)) == 0 ? [] : [var.http_target]
    iterator = h

    content {
      path_parameter_values   = lookup(h.value, "path_parameter_values", null)
      query_string_parameters = lookup(h.value, "query_string_parameters", null)
      header_parameters       = lookup(h.value, "header_parameters", null)
    }
  }

  dynamic "input_transformer" {
    for_each = length(keys(var.input_transformer)) == 0 ? [] : [var.input_transformer]
    iterator = i

    content {
      input_paths    = lookup(i.value, "input_paths", null) 
      input_template = i.value["input_template"]
    }
  }

  dynamic "retry_policy" {
    for_each = length(keys(var.retry_policy)) == 0 ? [] : [var.retry_policy]
    iterator = r

    content {
      maximum_event_age_in_seconds = lookup(r.value, "maximum_event_age_in_seconds", null)
      maximum_retry_attempts       = lookup(r.value, "maximum_retry_attempts", null)
    }
  }

  dynamic "dead_letter_config" {
    for_each = length(keys(var.dead_letter_config)) == 0 ? [] : [var.dead_letter_config]

    content {
      arn = lookup(dead_letter_config.value, "arn", null)
    }
  }
}