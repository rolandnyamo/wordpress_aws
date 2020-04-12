resource "aws_route_table" "pub" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  depends_on = ["aws_internet_gateway.igw"]

  tags = {
    Name = "rt-pub"
  }
}

resource "aws_route_table" "priv" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.natgw.id}"
  }

  depends_on = ["aws_nat_gateway.natgw"]

  tags = {
    Name = "rt-priv"
  }
}

resource "aws_route_table_association" "pub_a" {
  subnet_id      = "${aws_subnet.pub_a.id}"
  route_table_id = "${aws_route_table.pub.id}"
}

resource "aws_route_table_association" "pub_b" {
  subnet_id      = "${aws_subnet.pub_b.id}"
  route_table_id = "${aws_route_table.pub.id}"
}

resource "aws_route_table_association" "priv_a" {
  subnet_id      = "${aws_subnet.priv_a.id}"
  route_table_id = "${aws_route_table.priv.id}"
}

resource "aws_route_table_association" "priv_b" {
  subnet_id      = "${aws_subnet.priv_b.id}"
  route_table_id = "${aws_route_table.priv.id}"
}