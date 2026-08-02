resource "aws_lb" "backend_alb" {
  name               = "${local.common_name}-backend-alb"
  internal           = true #It tells AWS whether the Load Balancer should be public or private.
  load_balancer_type = "application"
  security_groups    = [local.backend_lb]
  subnets            = [local.private_subnet_id][0]

  enable_deletion_protection = false

  
  tags = merge (
    local.common_tags,
    {
        Name= "${local.common_name}-backend-alb"
    }
    
  )
}

resource "aws_lb_listener" "backend_listener" {
  load_balancer_arn = aws_lb.backend_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Hi i am from backend-alb  http"
      status_code  = "200"
    }
  }
}