resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc-cidr}"
  instance_tenancy = "default"

  tags {
    Name = "${var.project-name}-Proj-VPC"
  }
}