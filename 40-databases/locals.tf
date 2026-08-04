locals {
  ami_id=data.aws_ami.joindevops.id
  mongodb_sg_id=data.aws_ssm_parameter.mongodb_sg_id.value #/roboshop/dev/mongodb-sg-id
  redis_sg_id=data.aws_ssm_parameter.redis_sg_id.value #/roboshop/dev/redis-sg-id
  rabbitmq_sg_id=data.aws_ssm_parameter.rabbitmq_sg_id.value #/roboshop/dev/rabbitmq-sg-id
  mysql_sg_id=data.aws_ssm_parameter.mysql_sg_id.value #/roboshop/dev/mysql-sg-id
  common_tags={
    terraform= "true"
    project= var.project
    environment= var.environment
  }
  common_name="${var.project}-${var.environment}"
  
  database_subnet_ids=split("," , data.aws_ssm_parameter.database_subnet_ids.value)

}