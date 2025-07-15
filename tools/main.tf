module "tools" {
    for_each  = var.tools
    source = "../modules/ec2"
    ami     =  var.ami
    env     = var.env
    instance_type= each.value.instance_type
    zone_id = var.zone_id  
    zone_name= var.zone_name 
    name    = var.name
}

# resource "aws_s3_bucket" "example" {
#   bucket = "my-tf-test-bucket"
# 
#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
# }