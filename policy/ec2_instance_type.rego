package terraform.ec2

deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "aws_instance"
  instance_type := resource.change.after.instance_type
  not instance_type
  msg := sprintf("EC2 instance '%s' is missing instance_type.", [resource.address])
}

deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "aws_instance"
  instance_type := resource.change.after.instance_type
  instance_type != "t3.small"
  msg := sprintf(
    "EC2 instance '%s' must use instance_type t3.small (found: %s)",
    [resource.address, instance_type]
  )
}
