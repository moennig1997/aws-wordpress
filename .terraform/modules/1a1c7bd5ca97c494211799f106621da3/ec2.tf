resource "aws_instance" "wp_ec2" {
  ami           = "${var.wordpress_ami}"
  instance_type = "t2.micro"
  key_name =  "${var.key_name}"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.wp_ec2_sg.id}"]
  subnet_id = "${aws_subnet.wp_public_a.id}"
}