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