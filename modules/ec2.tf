resource "aws_instance" "wp_ecs" {
  ami           = "${var.wordpress_ami}"
  instance_type = "t2.micro"
  key_name =  "${var.key_name}"


}