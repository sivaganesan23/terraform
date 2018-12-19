resource "aws_security_group" "instance-sg" {
  name        = "Student-Proj-Instance-SG"
  description = "Student-Proj-Instance-SG"
  vpc_id      = "${var.vpcid}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "server" {
    count                   = 2
    ami                     = "${var.ami}"
    instance_type           = "t2.micro"
    key_name                = "${var.keyname}"
    subnet_id               = "${element(var.public_subnets, count.index)}"
    vpc_security_group_ids  = ["${aws_security_group.instance-sg.id}"]
    tags                    = {
        Name        = "${var.proj}-node-${element(var.az-single-char, count.index)}"
        Application = "${var.application}"
    }
}

resource "null_resource" "appsetup" {
    count = 2
    provisioner "remote-exec" {
        inline = [
        "sudo yum install ansible git -y",
        "ansible-pull -U https://github.com/citb33/ansible-pull.git webapp.yml -e DBUSER=${var.dbuser} -e DBPASS=${var.dbpass}  -e DBIP=${var.dbip} -e DBNAME=${var.dbname}",
        ]

        connection {
            type        = "ssh"
            user        = "centos"
            private_key = "${file("/home/centos/devops.pem")}"
            host        = "${element(aws_instance.server.*.private_ip, count.index)}"
        }
  }
}