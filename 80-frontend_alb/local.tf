locals {
  common_name= "${var.project}-${var.environment}"
  vpc_id=data.aws_ssm_parameter.vpc_id.value  
  frontend_lb=data.aws_ssm_parameter.frontend_lb_sg_id.value
  public_subnet_id=split("," , data.aws_ssm_parameter.public_subnet_id.value)
  ssl_certificate_arn=data.aws_ssm_parameter.ssl_certificate_arn.value
  common_tags={
    terraform= "true" 
    project= var.project
    environment= var.environment
  }
}