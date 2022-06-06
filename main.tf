provider "aws" {
  region = "us-west-1"
}

module "publisher-aws" {
  source  = "netskopeoss/publisher-aws/netskope"

  publisher_name              = var.publisher_name
  aws_key_name                = var.aws_key_name
  aws_subnet                  = var.aws_subnet_id
  aws_security_group          = var.aws_sg_id
  associate_public_ip_address = var.associate_public_ip_address

}
