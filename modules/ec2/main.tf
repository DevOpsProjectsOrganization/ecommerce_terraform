resource "aws_instance" "my_instance" {
    ami             = var.ami
    instance_type   =  var.instance_type
    tags            = {
        Name        = local.name
    }
    vpc_security_group_ids= [data.aws_security_group.selected.id]
}

resource "aws_route53_record" "my_private_record"{
    zone_id = var.zone_id
    name    = local.toolName
    type    = "A"
    ttl     = 300
    records = [aws_instance.my_instance.private_ip]
}

resource "aws_route53_record" "my_public_record"{
    count   = var.env==null ? 1 :0
    zone_id = var.zone_id
    name    = local.toolPublicName
    type    = "A"
    ttl     = 300
    records = [aws_instance.my_instance.public_ip]
}

resource "null_resource" "ansible"{
    count = var.env == null ?0 :1
    depends_on = [aws_route53_record.my_private_record]
    provisioner "remote-exec"{
         connection {
            type     = "ssh"
            user     = "ec2-user"
            password = "DevOps321"
            host     = aws_instance.my_instance.private_ip
        }
        inline = [
            "sudo pip3.11 install ansible hvac",
            "ansible-pull -i localhost, -U https://github.com/DevOpsProjectsOrganization/ecommerce_ansible roboshop.yml -e role=${var.name} -e token=${var.token} -e env=${var.env}"
        ]
       
    }
}