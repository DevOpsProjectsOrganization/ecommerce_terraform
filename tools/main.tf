module "tools" {
    for_each        = var.tools
    source          = "../modules/ec2"
    name            = each.key
    ami             =  var.ami
    env             = var.env
    instance_type   = each.value.instance_type
    zone_id         = var.zone_id  
    zone_name       = var.zone_name 
    
    
}
