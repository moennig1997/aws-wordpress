
resource "aws_internet_gateway" "wp_ig" {
  vpc_id = "${aws_vpc.wp_vpc.id}"
}