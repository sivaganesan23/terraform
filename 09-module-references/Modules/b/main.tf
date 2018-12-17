variable "vpc_id" {}

resource "aws_subnet" {
    vpc_id     = "${var.vpc_id}"
    cidr_block = "10.5.1.0/24"

} 