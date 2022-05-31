terraform {
    required_providers {
        netskope = {
        version = "0.2.0"
        source  = "github.com/netskopeoss/netskope"
        }
    }
}

provider "aws" {
  region = "us-west-1"
}

module "aws_publisher" {
  source = "github.com/ns-sbrown/terraform-netskope-publisher-aws"

  publisher_name              = var.publisher_name
  aws_key_name                = var.aws_key_name
  aws_subnet                  = var.aws_subnet_id
  aws_security_group          = var.aws_sg_id
  associate_public_ip_address = var.associate_public_ip_address

}
