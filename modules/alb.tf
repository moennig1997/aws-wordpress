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
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.fastladder_rails.id}"
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

  target_type = "ip"

  stickiness {
    type = "lb_cookie"
  }

  vpc_id = "${aws_vpc.wp_vpc.id}"
}