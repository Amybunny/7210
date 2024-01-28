output subnet_ids {
  value = data.aws_subnets.default.ids
}

output launch_template_id {
  value = aws_launch_template.example.id
}

output launch_template_arn {
  value = aws_launch_template.example.arn
}

output launch_template_latest_version {
  value = aws_launch_template.example.latest_version
}