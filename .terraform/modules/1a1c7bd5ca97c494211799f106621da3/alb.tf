resource "aws_alb" "wp_alb" {
  name = "wp-alb"

  subnets = [
    "${aws_subnet.wp_public_a.id}",
    "${aws_subnet.wp_public_c.id}",
  ]

  security_groups = [
    "${aws_security_group.wp_alb_sg.id}",
  ]
}


resource "aws_alb_listener" "wp_alb_listener" {

  load_balancer_arn = "${aws_alb.wp_alb.arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2015-05"
  certificate_arn   = "${var.certification_arn}"

  default_action {
    target_group_arn = "${aws_alb_target_group.wp_target_group.id}"
    type             = "forward"
  }
}

resource "aws_alb_target_group" "wp_target_group" {
  deregistration_delay = 10

  health_check {
    healthy_threshold   = 2
    interval            = 60
    matcher             = "302"
    path                = "/"
    timeout             = 10
    unhealthy_threshold = 5
  }
  
  name     = "wordpress"
  port     = 80
  protocol = "HTTP"

  stickiness {
    type = "lb_cookie"
  }

  vpc_id = "${aws_vpc.wp_vpc.id}"
}

resource "aws_lb_target_group_attachment" "wp_target_group_attachement" {
  target_group_arn = "${aws_alb_target_group.wp_target_group.arn}"
  target_id        = "${aws_instance.wp_ec2.id}"
  port             = 80
}