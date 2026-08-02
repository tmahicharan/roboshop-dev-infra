locals {
  ami_id=data.aws_ami.joindevops.id
  sg_id=data.aws_ssm_parameter.mongodb_sg_id.value #/roboshop/dev/mongodb-sg-id

  common_tags={
    terraform= "true"
    project= var.project
    environment= var.environment
  }
  common_name="${var.project}-${var.environment}"
  
  database_subnet_ids=split("," , data.aws_ssm_parameter.database_subnet_ids.value)

}