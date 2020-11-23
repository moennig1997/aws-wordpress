resource "aws_eip" "nat_gateway_eip_a" {
  vpc = true
}

resource "aws_eip" "nat_gateway_eip_c" {
  vpc = true
}

resource "aws_nat_gateway" "wp_nat_gateway_a" {
  subnet_id     = aws_subnet.wp_public_a.id
  allocation_id = aws_eip.nat_gateway_eip_a.id
}

resource "aws_nat_gateway" "wp_nat_gateway_c" {
  subnet_id     = aws_subnet.wp_public_c.id
  allocation_id = aws_eip.nat_gateway_eip_c.id
}
