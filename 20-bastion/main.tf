resource "aws_instance" "instance"{
    ami= local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids=[local.sg_id]
    subnet_id=local.public_subnet_ids[0]
    associate_public_ip_address = true  
    tags = merge (
    var.bastion_tags,
    local.common_tags,
    {
        Name= "${local.common_name}-bastion"
    }
  )
}