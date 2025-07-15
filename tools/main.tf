module "tools" {
    source = "../modules/ec2"
    ami     =  var.ami
    env     = var.env
    instance_type= var.instance_type
    zone_id = var.zone_id   
}

# resource "aws_s3_bucket" "example" {
#   bucket = "my-tf-test-bucket"
# 
#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
# }