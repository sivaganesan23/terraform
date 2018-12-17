variable "cidr_block" {
    default = "10.5.0.0/22"
}

resource "aws_vpc" "main" {
  cidr_block       = "${var.cidr_block}"
}

output "vpc_id" {
    value = "${aws_vpc.main.id}"
}