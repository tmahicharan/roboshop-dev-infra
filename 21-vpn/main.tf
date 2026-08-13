resource "aws_instance" "openvpn"{
    ami= local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids=[local.sg_id]
    subnet_id=local.public_subnet_ids[0]
    associate_public_ip_address = true  
    user_data = file("vpn.sh")
    tags = merge (
    var.vpn_tags,
    local.common_tags,
    {
        Name= "${local.common_name}-vpn"
    }
  )
}

resource "aws_route53_record" "openvpn" {
  zone_id = var.zone_id 
  name    = "openvpn.${var.domain_name}" 
  type    = "A"
  ttl     = 1
  records = [aws_instance.openvpn.public_ip]
  allow_overwrite= true
}

