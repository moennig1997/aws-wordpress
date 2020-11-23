resource "aws_vpc" "wp_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_vpc_endpoint" "wp_vpc_endpoint_s3" {
  vpc_id       = aws_vpc.wp_vpc.id
  service_name = "com.amazonaws.us-east-1.s3"
}