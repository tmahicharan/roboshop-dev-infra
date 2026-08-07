# frontend to frontendlb
resource "aws_security_group_rule" "frontend-frontendlb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id= local.frontend_lb
  security_group_id = local.frontend
}

# backend alb to bastion
resource "aws_security_group_rule" "backend-alb-bastion" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id= local.bastion
  security_group_id = local.backend_lb
}

# bastion to laptop
resource "aws_security_group_rule" "bastion-laptop" {
  security_group_id = local.bastion
  cidr_blocks = ["0.0.0.0/0"]
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
}

# mongodb to bastion
resource "aws_security_group_rule" "mongodb-bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= local.bastion
  security_group_id = local.mongodb
}

# redis to bastion
resource "aws_security_group_rule" "redis-bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= local.bastion
  security_group_id = local.redis
}

# rabbitmq to bastion
resource "aws_security_group_rule" "rabbitmq-bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= local.bastion
  security_group_id = local.rabbitmq
}

# mysql to bastion
resource "aws_security_group_rule" "mysql-bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= local.bastion
  security_group_id = local.mysql
}

#catalogue to bastion
resource "aws_security_group_rule" "catalogue-bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= local.bastion
  security_group_id = local.catalogue
}

#mongodb to catalogue
resource "aws_security_group_rule" "mongodb-catalogue" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  source_security_group_id= local.catalogue
  security_group_id = local.mongodb
}

#backendalb to catalogue
resource "aws_security_group_rule" "backend-alb-catalogue" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id= local.backend_lb
  security_group_id = local.catalogue
}

