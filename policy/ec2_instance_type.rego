package terraform.ec2

deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "aws_instance"
  resource.change.after.instance_type != "t3.small"

  msg := sprintf(
    "EC2 instance '%s' must use instance_type t3.small (found: %s)",
    [
      resource.name,
      resource.change.after.instance_type
    ]
  )
}
