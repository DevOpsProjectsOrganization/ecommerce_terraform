provider "aws" {
    region = "us-east-1"
}

terraform {
    backend "s3" {
        bucket  = terraform-bucket-85"
        key     = "ecommerce_terraform/{{var.env}}/terraform.tfstate"
        region  = "us-east-1"
    }
}