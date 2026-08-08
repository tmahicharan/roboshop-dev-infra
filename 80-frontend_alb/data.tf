data "aws_ssm_parameter" "vpc_id" {
  name =  "/${var.project}/${var.environment}-vpc_id" #/roboshop/dev-vpc_id
}

data "aws_ssm_parameter" "frontend_lb_sg_id" {
  name =  "/${var.project}/${var.environment}/frontend_lb-sg-id" #/roboshop/dev/frontend_lb-sg-id
}


data "aws_ssm_parameter" "public_subnet_id" {
  name =  "/${var.project}/${var.environment}-public-subnet-id"
}

data "aws_ssm_parameter" "ssl_certificate_arn" {
  name =  "/${var.project}/${var.environment}/frontend_alb_certificate_arn"
}