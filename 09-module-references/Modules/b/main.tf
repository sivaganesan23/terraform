variable "vpc_id" {
    type = "string"
}

resource "aws_subnet" {
    vpc_id     = "${var.vpcid}"
    cidr_block = "10.5.1.0/24"
} 