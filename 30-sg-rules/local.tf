locals {
  common_name= "${var.project}-${var.environment}"
  backend_lb=data.aws_ssm_parameter.backend_lb_sg_id.value
  bastion=data.aws_ssm_parameter.bastion_sg_id.value
  public_subnet_id=split("," , data.aws_ssm_parameter.public_subnet_id.value)
  frontend=data.aws_ssm_parameter.frontend_sg_id.value
  frontend_lb=data.aws_ssm_parameter.frontend_lb_sg_id.value
  mongodb=data.aws_ssm_parameter.mongodb_sg_id.value
  redis=data.aws_ssm_parameter.redis_sg_id.value
  rabbitmq=data.aws_ssm_parameter.rabbitmq_sg_id.value
  mysql=data.aws_ssm_parameter.mysql_sg_id.value
  catalogue=data.aws_ssm_parameter.catalogue_sg_id.value
  user=data.aws_ssm_parameter.user_sg_id.value
  cart=data.aws_ssm_parameter.cart_sg_id.value
  shipping=data.aws_ssm_parameter.shipping_sg_id.value
  payment=data.aws_ssm_parameter.payment_sg_id.value
}