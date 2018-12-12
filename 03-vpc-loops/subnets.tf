resource "aws_subnet" "pub-subnet" {
  count = 2
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${element(var.pub-sub-cidr , count.index)}"
  availability_zone = "${element(var.azs , count.index)}"
  tags {
    Name = "${var.project-name}-Proj-Public-Subnet-${element(var.azs-c , count.index)}"
  }
}

resource "aws_subnet" "priv-subnet" {
  count = 2
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${element(var.priv-sub-cidr , count.index)}"
  availability_zone = "${element(var.azs , count.index)}"
  tags {
    Name = "${var.project-name}-Proj-Private-Subnet-${element(var.azs-c , count.index)}"
  }
}

resource "aws_route_table_association" "pub-rt-assoc" {
  count = 2
  subnet_id      = "${element(aws_subnet.pub-subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.rtable-pub.id}"
}

resource "aws_route_table_association" "priv-rt-assoc" {
  subnet_id      = "${element(aws_subnet.priv-subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.rtable-priv.id}"
}