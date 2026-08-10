# DATABASES

# mongodb
# mongodb to bastion
resource "aws_security_group_rule" "mongodb-bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= local.bastion
  security_group_id = local.mongodb
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

#mongodb to user
resource "aws_security_group_rule" "mongodb-user" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  source_security_group_id= local.user
  security_group_id = local.mongodb
}

# redis
# redis to bastion
resource "aws_security_group_rule" "redis-bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= local.bastion
  security_group_id = local.redis
}

# redis to user
resource "aws_security_group_rule" "redis-user" {
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  source_security_group_id= local.user
  security_group_id = local.redis
}

# redis to cart
resource "aws_security_group_rule" "redis-cart" {
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  source_security_group_id= local.cart
  security_group_id = local.redis
}

# mysql
# mysql to bastion
resource "aws_security_group_rule" "mysql-bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= local.bastion
  security_group_id = local.mysql
}

# mysql to shipping
resource "aws_security_group_rule" "mysql-shipping" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id= local.shipping
  security_group_id = local.mysql
}

# rabbitmq
# rabbitmq to bastion
resource "aws_security_group_rule" "rabbitmq-bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= local.bastion
  security_group_id = local.rabbitmq
}

# rabbitmq to payment
resource "aws_security_group_rule" "rabbitmq-payment" {
  type              = "ingress"
  from_port         = 5672
  to_port           = 5672
  protocol          = "tcp"
  source_security_group_id= local.payment
  security_group_id = local.rabbitmq
}

# BACKEND

# catalogue
# catalogue to bastion
resource "aws_security_group_rule" "catalogue-bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= local.bastion
  security_group_id = local.catalogue
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



# user
# user to bastion
resource "aws_security_group_rule" "user-bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= local.bastion
  security_group_id = local.user
}

#backendalb to user
resource "aws_security_group_rule" "backend-alb-user" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id= local.backend_lb
  security_group_id = local.user
}



# CART
# cart to bastion
resource "aws_security_group_rule" "cart-bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= local.bastion
  security_group_id = local.cart
}

#backendalb to cart
resource "aws_security_group_rule" "backend-alb-cart" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id= local.backend_lb
  security_group_id = local.cart
}

#cart to backendalb
resource "aws_security_group_rule" "cart_backendalb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id= local.cart
  security_group_id = local.backend_lb
}


# Shipping
# shipping to bastion
resource "aws_security_group_rule" "shipping-bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= local.bastion
  security_group_id = local.shipping
}

#backendalb to shipping
resource "aws_security_group_rule" "backend-alb-shipping" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id= local.backend_lb
  security_group_id = local.shipping
}

#shipping to backendalb
resource "aws_security_group_rule" "shipping-backend-alb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id= local.shipping
  security_group_id = local.backend_lb
}


# PAYMENT
# payment to bastion
resource "aws_security_group_rule" "payment-bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= local.bastion
  security_group_id = local.payment
}

#backendalb to payment
resource "aws_security_group_rule" "backend-alb-payment" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id= local.backend_lb
  security_group_id = local.payment
}

#payment to backend_alb
resource "aws_security_group_rule" "payment_backend_alb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id= local.payment
  security_group_id = local.backend_lb
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


# FRONTEND

# frontend to backendalb
resource "aws_security_group_rule" "frontend_backendalb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id= local.frontend
  security_group_id = local.backend_lb
}
# frontend to frontendlb
resource "aws_security_group_rule" "frontend-frontendlb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id= local.frontend_lb
  security_group_id = local.frontend
}

# frontend to bastion
resource "aws_security_group_rule" "frontend-bastion" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id= local.frontend
  security_group_id = local.bastion
}


# public 

# bastion to laptop
resource "aws_security_group_rule" "bastion-laptop" {
  security_group_id = local.bastion
  cidr_blocks = ["0.0.0.0/0"]
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
}


# frontend_alb to laptop
resource "aws_security_group_rule" "frontend-alb-laptop" {
  security_group_id = local.frontend_lb
  cidr_blocks = ["0.0.0.0/0"]
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
}
