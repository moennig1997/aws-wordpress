
resource "aws_subnet" "wp_public_a" {
  availability_zone = "${var.region}a"
  cidr_block        = "10.0.1.0/24"
  vpc_id            = aws_vpc.wp_vpc.id
}

resource "aws_subnet" "wp_public_c" {
  availability_zone = "${var.region}c"
  cidr_block        = "10.0.2.0/24"
  vpc_id            = aws_vpc.wp_vpc.id
}

resource "aws_subnet" "wp_private_a" {
  availability_zone = "${var.region}a"
  cidr_block        = "10.0.128.0/24"
  vpc_id            = aws_vpc.wp_vpc.id
}

resource "aws_subnet" "wp_private_c" {
  availability_zone = "${var.region}c"
  cidr_block        = "10.0.129.0/24"
  vpc_id            = aws_vpc.wp_vpc.id
}