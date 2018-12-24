variable "region" {
  default = "us-east-1"
}
variable "access_key" {}
variable "secret_key" {}
variable "domain_name" {}
variable "zone_id" {}
variable "certification_arn" {}

provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region     = "${var.region}"
}


module "wp" {
    wordpress_ami      = "ami-01fcd26a79fd0b150"
    key_name            = "wordpressadm"
    source      = "./modules"
    region     = "${var.region}"
    zone_id = "${var.zone_id}"
    domain_name = "${var.domain_name}"
    certification_arn = "${var.certification_arn}"

}