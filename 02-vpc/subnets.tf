resource "aws_subnet" "pub-subnet1" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-2a"
  tags {
    Name = "${var.project-name}-Proj-Public-Subnet-A"
  }
}

resource "aws_route_table_association" "pub-a" {
  subnet_id      = "${aws_subnet.pub-subnet1.id}"
  route_table_id = "${aws_route_table.rtable-pub.id}"
}

resource "aws_subnet" "pub-subnet2" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2b"
  tags {
    Name = "${var.project-name}-Proj-Public-Subnet-B"
  }
}

resource "aws_route_table_association" "pub-b" {
  subnet_id      = "${aws_subnet.pub-subnet2.id}"
  route_table_id = "${aws_route_table.rtable-pub.id}"
}

resource "aws_subnet" "priv-subnet1" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-2a"
  tags {
    Name = "${var.project-name}-Proj-Private-Subnet-A"
  }
}

resource "aws_route_table_association" "priv-a" {
  subnet_id      = "${aws_subnet.priv-subnet1.id}"
  route_table_id = "${aws_route_table.rtable-priv.id}"
}

resource "aws_subnet" "priv-subnet2" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-2b"
  tags {
    Name = "${var.project-name}-Proj-Private-Subnet-B"
  }
}

resource "aws_route_table_association" "priv-b" {
  subnet_id      = "${aws_subnet.priv-subnet2.id}"
  route_table_id = "${aws_route_table.rtable-priv.id}"
}