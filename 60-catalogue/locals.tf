locals {
  ami_id=data.aws_ami.joindevops.id
  sg_id=data.aws_ssm_parameter.catalogue_sg_id.value

  common_tags={
    terraform= "true"
    project= var.project
    environment= var.environment
  }
  common_name="${var.project}-${var.environment}"
  
  private_subnet_ids=split("," , data.aws_ssm_parameter.private_subnet_ids.value)
  vpc_id=data.aws_ssm_parameter.vpc_id.value
  backend_listener_arn=data.aws_ssm_parameter.backend_listener_arn.value
}