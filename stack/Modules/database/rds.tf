resource "aws_db_parameter_group" "default" {
  name   = "mariadb-student-pg"
  family = "mariadb10.3"
}

resource "aws_db_subnet_group" "default" {
  name       = "${var.proj}-subnet-group"
  subnet_ids = ["${var.private_subnets}"]

  tags = {
    Name = "MariaDB-SubnetGroup"
  }
}

resource "aws_db_instance" "student-rds" {
  allocated_storage     = 10
  storage_type          = "gp2"
  engine                = "mariadb"
  engine_version        = "10.3"
  instance_class        = "db.t2.micro"
  username              = "${var.dbname}"
  password              = "${var.dbpass}"
  parameter_group_name  = "${aws_db_parameter_group.default.id}"
  db_subnet_group_name  = "${}"
  skip_final_snapshot   = true
  identifier            = "rds-studentapp"
  tags = {
    Name        = "${var.proj}-rds"
    Application = "${var.application}"
  }
}

