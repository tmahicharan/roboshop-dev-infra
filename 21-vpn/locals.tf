locals {
  ami_id=data.aws_ami.openvpn.id
  sg_id=data.aws_ssm_parameter.openvpn_sg_id.value

  common_tags={
    terraform= "true"
    project= var.project
    environment= var.environment
  }
  common_name="${var.project}-${var.environment}"
  
  public_subnet_ids=split("," , data.aws_ssm_parameter.public_subnet_ids.value)

}