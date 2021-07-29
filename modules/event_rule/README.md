## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.55 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.55 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_arn"></a> [arn](#input\_arn) | The Amazon Resource Name (ARN) of the target. | `string` | `null` | no |
| <a name="input_batch_target"></a> [batch\_target](#input\_batch\_target) | (Optional) Parameters used when you are using the rule to invoke an Amazon Batch Job. Maximum 1 allowed | `any` | `{}` | no |
| <a name="input_create_rule"></a> [create\_rule](#input\_create\_rule) | Whether to create the Cloudwatch event rule | `bool` | `true` | no |
| <a name="input_create_target"></a> [create\_target](#input\_create\_target) | Whether to create the CloudWatch event rule target | `bool` | `true` | no |
| <a name="input_dead_letter_config"></a> [dead\_letter\_config](#input\_dead\_letter\_config) | (Optional) Parameters used when you are providing a dead letter config. Maximum 1 allowed | `any` | `{}` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the rule | `string` | `null` | no |
| <a name="input_ecs_target"></a> [ecs\_target](#input\_ecs\_target) | (Optional) Parameters used when you are using the rule to invoke Amazon ECS Task. . Maximum 1 allowed | `any` | `{}` | no |
| <a name="input_event_bus_name"></a> [event\_bus\_name](#input\_event\_bus\_name) | The event bus to associate with this rule. If you omit this, the default event bus is used. | `string` | `null` | no |
| <a name="input_event_pattern"></a> [event\_pattern](#input\_event\_pattern) | The event pattern described a JSON object. At least one of schedule\_expression or event\_pattern is required. | `string` | `null` | no |
| <a name="input_http_target"></a> [http\_target](#input\_http\_target) | (Optional) Parameters used when you are using the rule to invoke an API Gateway REST endpoint. Maximum 1 allowed | `any` | `{}` | no |
| <a name="input_input"></a> [input](#input\_input) | Valid JSON text passed to the target. Conflicts with input\_path and input\_transformer. | `string` | `null` | no |
| <a name="input_input_path"></a> [input\_path](#input\_input\_path) | The value of the JSONPath that is used for extracting part of the matched event when passing it to the target. Conflicts with input and input\_transformer. | `string` | `null` | no |
| <a name="input_input_transformer"></a> [input\_transformer](#input\_input\_transformer) | (Optional) Parameters used when you are providing a custom input to a target based on certain event data. Conflicts with input and input\_path. | `any` | `{}` | no |
| <a name="input_is_enabled"></a> [is\_enabled](#input\_is\_enabled) | Whether the rule should be enabled. | `bool` | `true` | no |
| <a name="input_kinesis_target"></a> [kinesis\_target](#input\_kinesis\_target) | (Optional) Parameters used when you are using the rule to invoke an Amazon Kinesis Stream. Maximum 1 allowed | `any` | `{}` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | A name prefix for the event rule | `string` | `null` | no |
| <a name="input_retry_policy"></a> [retry\_policy](#input\_retry\_policy) | (Optional) Parameters used when you are providing retry policies. Maximum 1 allowed | `any` | `{}` | no |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | The Amazon Resource Name (ARN) associated with the role that is used for target invocation. | `string` | `null` | no |
| <a name="input_rule_name"></a> [rule\_name](#input\_rule\_name) | A name for the event rule | `string` | `null` | no |
| <a name="input_run_command_targets"></a> [run\_command\_targets](#input\_run\_command\_targets) | (Optional) Parameters used when you are using the rule to invoke Amazon EC2 Run Command. Maximum 5 allowed | `any` | `{}` | no |
| <a name="input_schedule_expression"></a> [schedule\_expression](#input\_schedule\_expression) | The scheduling expression. For example, cron(0 20 * * ? *) or rate(5 minutes). At least one of schedule\_expression or event\_pattern is required. | `string` | `null` | no |
| <a name="input_sqs_target"></a> [sqs\_target](#input\_sqs\_target) | (Optional) Parameters used when you are using the rule to invoke an Amazon SQS Queue. Maximum 1 allowed | `any` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource. | `map` | `{}` | no |
| <a name="input_target_id"></a> [target\_id](#input\_target\_id) | The unique target assignment ID. If missing, will generate a random, unique id. | `string` | `null` | no |
| <a name="input_target_role_arn"></a> [target\_role\_arn](#input\_target\_role\_arn) | The Amazon Resource Name (ARN) of the IAM role to be used for this target when the rule is triggered. Required if ecs\_target is used. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of Cloudwatch event rule |
| <a name="output_id"></a> [id](#output\_id) | ID of Cloudwatch event rule |
