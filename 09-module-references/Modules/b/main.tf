variable "vpc_id" {}

resource "aws_subnet" {
    vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.1.0/24"

} 