locals {
    "proj" = "student"
}
resource "aws_vpc" "main2" {
    cidr_block = "10.0.2.0/24"
    tags = {
        "Name" = "${local.proj}-vpc2"
    }
}
