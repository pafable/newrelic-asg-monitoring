terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

resource "aws_autoscaling_group" "tf_asg" {
  name               = "${var.project}-${terraform.workspace}"
  availability_zones = ["us-east-2a", "us-east-2b", "us-east-2c"]
  max_size           = 3
  min_size           = 1
  desired_capacity   = 2

  launch_template {
    id = aws_launch_template.tf_lt.id
  }
}