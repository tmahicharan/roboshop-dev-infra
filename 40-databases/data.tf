data "aws_ssm_parameter" "mongodb_sg_id" {
  name = "/${var.project}/${var.environment}/mongodb-sg-id"  #/roboshop/dev/mongodb-sg-id
}
data "aws_ami" "aws_ami" {
  most_recent      = true
  owners           = ["992382739861"]

  filter {
    name   = "name"
    values = ["eks-auto-nvidia-1.30-x86_64-20241208-2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ssm_parameter" "database_subnet_ids" {
  name = "/${var.project}/${var.environment}-database-subnet-id" #/roboshop/dev-database-subnet-id
}
