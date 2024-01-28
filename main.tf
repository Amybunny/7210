provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_launch_template" "example" {
  image_id               = "ami-07c589821f2b353aa"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]
  user_data              = base64encode(data.template_file.web_shell.rendered)
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "example" {
  launch_template {
    id = aws_launch_template.example.id
    version = "$Latest"
    }
  vpc_zone_identifier  = data.aws_subnets.default.ids
  min_size             = 2
  max_size             = 10

  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
  }
}

