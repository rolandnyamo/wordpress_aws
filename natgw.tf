resource "aws_nat_gateway" "natgw" {
  depends_on = ["aws_internet_gateway.igw"]
  subnet_id = "${aws_subnet.pub_a.id}"
  allocation_id = "${aws_eip.natgw.id}"


  tags = {
    Name = "wprdPress_NATGW"
  }
}

resource "aws_eip" "natgw" {
  vpc = true
}
