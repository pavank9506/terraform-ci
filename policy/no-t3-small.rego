package terraform.ec2

allowed_instance_type = "t3.small"

deny[msg] {
  r := input.resource_changes[_]

  # Only target EC2 instances
  r.type == "aws_instance"

  # Instance type after change
  instance_type := r.change.after.instance_type

  # Fail if not allowed
  instance_type != allowed_instance_type

  msg := sprintf(
    "EC2 instance %s has instance_type %s. Only %s is allowed.",
    [r.address, instance_type, allowed_instance_type]
  )
}

