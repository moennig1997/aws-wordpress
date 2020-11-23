variable "domain_name" {}
variable "zone_id" {}
variable "certification_arn" {}
variable "wordpress_ami" {}
variable "key_name" {}
variable "region" {}

provider "aws" {
    region = var.region
}


module "wp" {
    wordpress_ami      = var.wordpress_ami
    key_name            = var.key_name
    source      = "./modules"
    region     = var.region
    zone_id = var.zone_id
    domain_name = var.domain_name
    certification_arn = var.certification_arn
}