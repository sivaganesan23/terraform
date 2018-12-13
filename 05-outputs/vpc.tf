resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
}

output "VPC-ID" {
    value = "${aws_vpc.main.id}"
}

resource "local_file" "vpc_id" {
  content  = "VPC-ID=${aws_vpc.main.id}\nVPC-ARN=${aws_vpc.main.arn}"
  filename = "/tmp/vpc_id.txt"
}