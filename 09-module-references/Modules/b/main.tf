
resource "aws_subnet" "" {
    vpc_id     = "${module.a.vpc_id}"
    cidr_block = "10.5.1.0/24"
} 