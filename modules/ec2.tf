resource "aws_iam_instance_profile" "wp_ec2_profile" {
  role = "AmazonSSMRoleForInstancesQuickSetup"
}

resource "aws_instance" "wp_ec2" {
  ami           = var.wordpress_ami
  instance_type = "t2.micro"
  key_name =  var.key_name
  associate_public_ip_address = false
  vpc_security_group_ids = [aws_security_group.wp_ec2_sg.id]
  subnet_id = aws_subnet.wp_private_a.id
  user_data = file("modules/install_ssm-agent.sh")
  iam_instance_profile = aws_iam_instance_profile.wp_ec2_profile.name
}