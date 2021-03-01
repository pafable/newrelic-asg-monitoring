data "aws_ami" "tf_ami" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["new-relic-poc-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_launch_template" "tf_lt" {
  name          = "${var.project}-launch-template-${terraform.workspace}"
  description   = "This launch template is for a New Relic Demo"
  instance_type = "t2.micro"
  key_name      = var.sshkey
  image_id      = data.aws_ami.tf_ami.id
  tags          = var.tags

  tag_specifications {
    resource_type = "instance"
    tags          = var.tags
  }

  update_default_version = true
  user_data              = filebase64("userdata.sh")
  vpc_security_group_ids = ["sg-0001","sg-0002"]
}