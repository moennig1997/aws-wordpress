variable "region" {
  default = "us-east-1"
}


terraform {
  backend "s3" {
      bucket = "terraform-state-bucket-wp"
      key = "wordpress-env"
      region = "${var.region}"
  }
}

provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region     = "${var.region}"
}

module "wp" {
    wordpress_ami      = "ami-01fcd26a79fd0b150"
    keyname            = " "

    source      = "./modules"
}