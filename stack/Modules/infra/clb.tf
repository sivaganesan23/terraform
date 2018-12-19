resource "aws_elb" "app-elb" {
  name               = "${var.proj}-app-clb"
  security_groups       = ["${aws_security_group.instance-sg.id}"]


  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:80"
    interval            = 30
  }
  
  subnets                     = ["${var.public_subnets}"]
  instances                   = ["${aws_instance.server.*.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "${var.proj}-app-clb"
  }
}