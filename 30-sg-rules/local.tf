locals {
  common_name= "${var.project}-${var.environment}"
  backend_lb=data.aws_ssm_parameter.backend_lb_sg_id.value
  bastion=data.aws_ssm_parameter.bastion_sg_id.value
  public_subnet_id=split("," , data.aws_ssm_parameter.public_subnet_id.value)
  frontend=data.aws_ssm_parameter.frontend_sg_id.value
  frontend_lb=data.aws_ssm_parameter.frontend_lb_sg_id.value
  mongodb=data.aws_ssm_parameter.mongodb_sg_id.value
}