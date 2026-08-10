module "components" {
    for_each = var.components
    source = "git::https://github.com/tmahicharan/terraform-roboshop-component.git"
    component= each.key
    rule_priority= each.value.rule_priority
}