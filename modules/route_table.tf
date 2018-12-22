
resource "aws_route_table" "wp_route_table" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.wp_ig.id}"
  }

  vpc_id = "${aws_vpc.wp_vpc.id}"
}

resource "aws_route_table_association" "subnet_a" {
  route_table_id = "${aws_route_table.wp_route_table.id}"
  subnet_id      = "${aws_subnet.wp_public_a.id}"
}

resource "aws_route_table_association" "subnet_c" {
  route_table_id = "${aws_route_table.wp_route_table.id}"
  subnet_id      = "${aws_subnet.wp_public_c.id}"
}