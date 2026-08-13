data "aws_ssm_parameter" "backend_lb_sg_id" {
  name =  "/${var.project}/${var.environment}/backend_lb-sg-id" #
}

data "aws_ssm_parameter" "bastion_sg_id" {
  name =  "/${var.project}/${var.environment}/bastion-sg-id"
}

data "aws_ssm_parameter" "public_subnet_id" {
  name =  "/${var.project}/${var.environment}-public-subnet-id"
}

data "aws_ssm_parameter" "frontend_sg_id" {
  name =  "/${var.project}/${var.environment}/frontend-sg-id" #/roboshop/dev/frontend-sg-id
}

data "aws_ssm_parameter" "frontend_lb_sg_id" {
  name =  "/${var.project}/${var.environment}/frontend_lb-sg-id" # /roboshop/dev/frontend_lb-sg-id
}

data "aws_ssm_parameter" "mongodb_sg_id" {
  name =  "/${var.project}/${var.environment}/mongodb-sg-id" # /roboshop/dev/mongodb-sg-id  
}

data "aws_ssm_parameter" "redis_sg_id" {
  name =  "/${var.project}/${var.environment}/redis-sg-id" # /roboshop/dev/redis-sg-id  
}

data "aws_ssm_parameter" "rabbitmq_sg_id" {
  name =  "/${var.project}/${var.environment}/rabbitmq-sg-id" # /roboshop/dev/rabbitmq-sg-id  
}

data "aws_ssm_parameter" "mysql_sg_id" {
  name =  "/${var.project}/${var.environment}/mysql-sg-id" # /roboshop/dev/mysql-sg-id  
}

data "aws_ssm_parameter" "catalogue_sg_id" {
  name =  "/${var.project}/${var.environment}/catalogue-sg-id" # /roboshop/dev/catalogue-sg-id  
}

data "aws_ssm_parameter" "user_sg_id" {
  name =  "/${var.project}/${var.environment}/user-sg-id" # /roboshop/dev/user-sg-id  
}

data "aws_ssm_parameter" "cart_sg_id" {
  name =  "/${var.project}/${var.environment}/cart-sg-id" # /roboshop/dev/cart-sg-id  
}

data "aws_ssm_parameter" "shipping_sg_id" {
  name =  "/${var.project}/${var.environment}/shipping-sg-id" # /roboshop/dev/shipping-sg-id  
}

data "aws_ssm_parameter" "payment_sg_id" {
  name =  "/${var.project}/${var.environment}/payment-sg-id" # /roboshop/dev/payment-sg-id  
}

data "aws_ssm_parameter" "openvpn_sg_id" {
  name =  "/${var.project}/${var.environment}/openvpn-sg-id" # /roboshop/dev/payment-sg-id  
}




