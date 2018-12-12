resource "aws_route_table" "rtable-pub" {
  vpc_id = "${aws_vpc.main.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
  tags {
    Name = "${var.project-name}-Proj-Public-RT"
  }
}

resource "aws_route_table" "rtable-priv" {
  vpc_id = "${aws_vpc.main.id}"
  tags {
    Name = "${var.project-name}-Proj-Private-RT"
  }
}