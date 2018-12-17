variable "vpc_id" {
    type = "string"
}

resource "aws_subnet" "main" {
    vpc_id     = "${var.vpc_id}"
    cidr_block = "10.5.1.0/24"
} 