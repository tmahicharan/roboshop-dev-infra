variable "project" {
  default ="roboshop"
}

variable "environment" {
  default ="dev"
}

variable "mongodb_tags" {
    type= map
    default ={} 
}