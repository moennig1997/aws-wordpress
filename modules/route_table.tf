
resource "aws_route_table" "wp_route_table_public" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.wp_ig.id
  }

  vpc_id = aws_vpc.wp_vpc.id
}

resource "aws_route_table_association" "public_a" {
  route_table_id = aws_route_table.wp_route_table_public.id
  subnet_id      = aws_subnet.wp_public_a.id
}

resource "aws_route_table_association" "public_c" {
  route_table_id = aws_route_table.wp_route_table_public.id
  subnet_id      = aws_subnet.wp_public_c.id
}


resource "aws_route_table" "wp_route_table_private_a" {
  vpc_id = aws_vpc.wp_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.wp_nat_gateway_a.id
  }
}

resource "aws_route_table_association" "private_a" {
  route_table_id = aws_route_table.wp_route_table_private_a.id
  subnet_id      = aws_subnet.wp_private_a.id
}

resource "aws_route_table" "wp_route_table_private_c" {
  vpc_id = aws_vpc.wp_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.wp_nat_gateway_c.id
  }
}

resource "aws_route_table_association" "private_c" {
  route_table_id = aws_route_table.wp_route_table_private_c.id
  subnet_id      = aws_subnet.wp_private_c.id
}