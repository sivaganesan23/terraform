resource "aws_vpc" "main1" {
    cidr_block = "10.0.1.0/24"
    tags = {
        "Name" = "${var.proj}-vpc1"
        "Name1" = "${local.proj}-vpc1"
    }
}
