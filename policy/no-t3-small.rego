package main

deny[msg] {
  input.resource_type == "aws_instance"
  input.instance_type != "t3.micro"
  msg := sprintf("%v instance type is not allowed. Only t3.micro is permitted.", [input.instance_type])
}
