resource "aws_ssm_parameter" "aws_lb_listener_frontend_listener" {
  name  = "/${var.project}/${var.environment}/frontend_alb_listener_arn"
  type  = "String"
  value = aws_lb_listener.frontend_listener.arn
}