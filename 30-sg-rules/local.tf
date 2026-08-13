locals {
  common_name= "${var.project}-${var.environment}"
  backend_lb=data.aws_ssm_parameter.backend_lb_sg_id.value
  bastion=data.aws_ssm_parameter.bastion_sg_id.value
  public_subnet_id=split("," , data.aws_ssm_parameter.public_subnet_id.value)
  frontend=data.aws_ssm_parameter.frontend_sg_id.value
  frontend_lb=data.aws_ssm_parameter.frontend_lb_sg_id.value
  mongodb=data.aws_ssm_parameter.mongodb_sg_id.value
  redis=data.aws_ssm_parameter.redis_sg_id.value
  rabbitmq=data.aws_ssm_parameter.rabbitmq_sg_id.value
  mysql=data.aws_ssm_parameter.mysql_sg_id.value
  catalogue=data.aws_ssm_parameter.catalogue_sg_id.value
  user=data.aws_ssm_parameter.user_sg_id.value
  cart=data.aws_ssm_parameter.cart_sg_id.value
  shipping=data.aws_ssm_parameter.shipping_sg_id.value
  payment=data.aws_ssm_parameter.payment_sg_id.value
  openvpn=data.aws_ssm_parameter.openvpn_sg_id.value

  vpn_ingress_rules={
    mysql={
      sg_id= local.mysql
      port=22
    }
    redis={
      sg_id= local.redis
      port=22
    }
    rabbitmq={
      sg_id= local.rabbitmq
      port=22
    }
    mongodb={
      sg_id= local.mongodb
      port=22
    }
    catalogue={
      sg_id= local.catalogue
      port=22
    }
    user={
      sg_id= local.user
      port=22
    }
    cart={
      sg_id= local.cart
      port=22
    }
    payment={
      sg_id= local.payment
      port=22
    }
    shipping={
      sg_id= local.shipping
      port=22
    }
    frontend={
      sg_id= local.frontend
      port=22
    }
  }
}