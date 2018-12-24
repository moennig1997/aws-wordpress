resource "aws_route53_record" "www" {
  zone_id = "${var.zone_id}"
  name    = "${var.domain_name}"
  type    = "A"

  alias {
    name                   = "${aws_alb.wp_alb.dns_name}"
    zone_id                = "${aws_alb.wp_alb.zone_id}"
    evaluate_target_health = true
  }
}