resource "aws_security_group" "wp_ec2_sg" {
  name        = "wp_ec2_sg"
  vpc_id      = "${aws_vpc.wp_vpc.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "-1"

    security_groups = [
      "${aws_security_group.wp_alb_sg.id}",
    ]  
  }

  egress {
    from_port       = 0
    to_port         = 65535
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "wp_alb_sg" {
  name        = "wp_alb_sg"
  vpc_id      = "${aws_vpc.wp_vpc.id}"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 65535
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
