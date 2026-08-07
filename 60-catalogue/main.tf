# launch instance for catalogue service
resource "aws_instance" "catalogue"{
    ami= local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids=[local.sg_id]
    subnet_id=local.private_subnet_ids[0]
    
    
    tags = merge (
    
    local.common_tags,
    {
        Name= "${local.common_name}-catalogue"
    }
  )
}

#configure catalogue service
resource "terraform_data" "catalogue" {
  triggers_replace = [
    aws_instance.catalogue.id
  ]

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.catalogue.private_ip
  }

 provisioner "file" {
  source      = "catalogue.sh"
  destination = "/tmp/catalogue.sh"
 }

 provisioner "remote-exec" {
  inline = [
    "chmod +x /tmp/catalogue.sh",
    "sudo sh /tmp/catalogue.sh catalogue ${var.environment}"
  ]

 }
}

# stop the instance for taking image
resource "aws_ec2_instance_state" "catalogue_state" {
  instance_id = aws_instance.catalogue.id
  state       = "stopped"
  depends_on = [terraform_data.catalogue]
}

# Taking catalogue image
resource "aws_ami_from_instance" "catalogue_ami" {
  name               = "${local.common_name}-catalogue-ami"
  source_instance_id = aws_instance.catalogue.id
  depends_on = [aws_ec2_instance_state.catalogue_state]
}

# Target group
resource "aws_lb_target_group" "catalogue" {
  name        = "${local.common_name}-catalogue"
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = local.vpc_id
  deregistration_delay = 60
  health_check{
    healthy_threshold = 2
    unhealthy_threshold= 2
    timeout = 2
    interval = 10
    matcher = "200-299"
    port = 8080
    protocol = "HTTP"
    path = "/health"

  }

}

# launch template
resource "aws_launch_template" "catalogue" {
  name = "${local.common_name}-catalogue"
  image_id = aws_ami_from_instance.catalogue_ami.id
  instance_initiated_shutdown_behavior = "terminate"
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.sg_id]
  
  #tags attached to the instance created by launch template
  tag_specifications {
    resource_type = "instance"

    tags = merge(
      local.common_tags,
      {
        Name = "${local.common_name}-catalogue"
      }
    )
  }

  #tags attached to the volume created by launch template
  tag_specifications {
    resource_type = "volume"

    tags = merge(
      local.common_tags,
      {
        Name = "${local.common_name}-catalogue"
      }
    )
  }

  #tags attached to the launch template
  tags = merge(
    local.common_tags,
    {
      Name = "${local.common_name}-catalogue"
    }
  )
}

# Auto Scaling Group
resource "aws_autoscaling_group" "catalogue" {
  name                      = "${local.common_name}-catalogue"
  max_size                  = 10
  min_size                  = 1
  health_check_grace_period = 100
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = false
  launch_template {
    id      = aws_launch_template.catalogue.id
    version = aws_launch_template.catalogue.latest_version
  }
  vpc_zone_identifier       = [local.private_subnet_ids[0], local.private_subnet_ids[1]]
  target_group_arns         = [aws_lb_target_group.catalogue.arn]

  dynamic "tag" {
    for_each = merge(
      local.common_tags,
      {
        Name = "${local.common_name}-catalogue"
      }
    )
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
  timeouts {
    delete = "15m"
  }

}

# Auto Scaling Policy

resource "aws_autoscaling_policy" "catalogue_policy" {
  autoscaling_group_name = aws_autoscaling_group.catalogue.name
  name                   = "${local.common_name}-catalogue-policy"
  policy_type            = "TargetTrackingScaling"
  target_tracking_configuration {
      predefined_metric_specification {
        predefined_metric_type = "ASGAverageCPUUtilization"
      }
     target_value = 75.0
  }
}

#ALB Listener Rule for catalogue service
resource "aws_lb_listener_rule" "catalogue_rule" {
  listener_arn = local.listener_arn
  priority     = 10

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.catalogue.arn
  }

  condition {
    host_header {
      values = ["catalogue.backend-alb-${var.environment}.${var.domain_name}"]
    }
  }
}

# Delete the instance after taking image
resource "terraform_data" "catalogue_local" {
  triggers_replace = [
    aws_instance.catalogue.id
  ]

 depends_on = [ aws_autoscaling_policy.catalogue_policy ]
 provisioner "local-exec" {
  command = "aws ec2 terminate-instances --instance-ids ${aws_instance.catalogue.id}"
 }
}
