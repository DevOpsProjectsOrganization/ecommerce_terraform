variable "tools" {
  default ={
    vault = {
          instance_type = "t2.micro" 
      }
  }
}
variable "ami" {
  default = "ami-09c813fb71547fc4f"
}
variable "zone_id" {
  default = "Z08786032W2NWXT9UW4JD"
}  
variable "zone_name" {
    default = "sdevops.shop"
}
variable "env" {
  default = null 
}
variable "token" {}
