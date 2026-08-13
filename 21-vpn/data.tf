data "aws_ssm_parameter" "openvpn_sg_id" {
  name = "/${var.project}/${var.environment}/openvpn-sg-id"  #/roboshop/dev/openvpn-sg-id
}
data "aws_ami" "openvpn" {
  owners      = ["677673473487"]
  most_recent = true

  filter {
    name   = "name"
    values = ["OpenVPN Access Server Community Image-fe8020db-5343-4c43-9e65-5ed4a825c931"]
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


data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.project}/${var.environment}-public-subnet-id"
}
