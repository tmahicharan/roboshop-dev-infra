resource "aws_ssm_parameter" "aws_lb_listener_backend_listener" {
  name  = "/${var.project}/${var.environment}/backend_alb_listener_arn"
  type  = "String"
  value = aws_lb_listener.backend_listener.arn
}