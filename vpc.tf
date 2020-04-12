resource "aws_vpc" "main" {
  cidr_block = "10.1.0.0/16"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "WordPress_test"
  }
}

resource "aws_subnet" "priv_a" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.1.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Priv_a"
  }
}
resource "aws_subnet" "priv_b" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.1.1.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Priv_b"
  }  
}
resource "aws_subnet" "pub_a" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.1.2.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "Pub_a"
  }
}
resource "aws_subnet" "pub_b" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.1.3.0/24"
  availability_zone = "us-east-1d"

  tags = {
    Name = "Pub_b"
  }
}