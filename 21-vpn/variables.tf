variable "project" {
  default ="roboshop"
}

variable "environment" {
  default ="dev"
}

variable "vpn_tags" {
    type= map
    default ={} 
}

variable "zone_id" {
  type = string
  default= "Z0333367NHGBMIBI3F"
}

variable "domain_name" {
  type = string
  default= "mahidevops.fun"
}