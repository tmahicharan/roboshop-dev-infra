locals {
  common_name= "${var.project}-${var.environment}"
  vpc_id=data.aws_ssm_parameter.vpc_id.value  
  backend_lb=data.aws_ssm_parameter.backend_lb_sg_id.value
  private_subnet_id=split("," , data.aws_ssm_parameter.private_subnet_id.value)
  common_tags={
    terraform= "true"
    project= var.project
    environment= var.environment
  }
}