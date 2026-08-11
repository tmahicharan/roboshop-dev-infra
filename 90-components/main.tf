module "components" {
    for_each = var.components
    source = "git::https://github.com/tmahicharan/terraform-roboshop-component.git"
    component= each.key
    rule_priority= each.value.rule_priority
    iam_instance_profile = aws_iam_instance_profile.components.name
}

resource "aws_iam_instance_profile" "components" {
  name = "components"
  role = "EC2SSMParameterRead"
}