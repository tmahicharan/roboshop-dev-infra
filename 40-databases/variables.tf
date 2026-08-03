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

  variable "redis_tags" {
      type= map
      default ={} 
  }

  variable "mysql_tags" {
      type= map
      default ={} 
  }