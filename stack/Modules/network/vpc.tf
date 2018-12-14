resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name        = "${var.proj}-VPC"
    Application = "${var.application}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name        = "${var.proj}-IGW"
    Application = "${var.application}"
  }
}

resource "aws_route_table" "pub-rt" {
  vpc_id    = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = {
    Name        = "${var.proj}-Public-RT"
    Application = "${var.application}"
  }
}

resource "aws_route_table" "priv-rt" {
  vpc_id    = "${aws_vpc.main.id}"

  tags = {
    Name        = "${var.proj}-Private-RT"
    Application = "${var.application}"
  }
}

resource "aws_subnet" "public" {
    count       = "${length(var.pub-subnets)}"
    vpc_id      = "${aws_vpc.main.id}"
    cidr_block  = "${element(var.pub-subnets, count.index)}"

  tags = {
    #Name        = "Subnet-Public-${var.proj}-${var.az-single-char}"
    Application = "${var.application}"
  }
}

resource "aws_subnet" "private" {
    count       = "${length(var.priv-subnets)}"
    vpc_id      = "${aws_vpc.main.id}"
    cidr_block  = "${element(var.priv-subnets, count.index)}"

  tags = {
    Name        = "Subnet-Private-${var.proj}-${var.az-single-char}"
    Application = "${var.application}"
  }
}

resource "aws_route_table_association" "pub-rta" {
    count           = "${length(var.pub-subnets)}"
    subnet_id       = "${element(aws_subnet.public.*.id, count.index)}"
    route_table_id  = "${aws_route_table.pub-rt.id}"
}

resource "aws_route_table_association" "priv-rta" {
    count           = "${length(var.priv-subnets)}"
    subnet_id       = "${element(aws_subnet.private.*.id, count.index)}"
    route_table_id  = "${aws_route_table.priv-rt.id}"
}