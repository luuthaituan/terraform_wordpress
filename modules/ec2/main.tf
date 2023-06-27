resource "aws_launch_configuration" "wordpress-lc-dev" {
  image_id        = "ami-0b1217c6bff20e276"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.wordpress-sg-dev.id]
  user_data       = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
              yum install -y httpd mariadb-server
              systemctl start httpd
              systemctl enable httpd
              systemctl start mariadb
              systemctl enable mariadb
              mysql -e "CREATE DATABASE wordpress;"
              mysql -e "CREATE USER 'wordpress'@'localhost' IDENTIFIED BY 'password';"
              mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost';"
              EOF
}

resource "aws_security_group" "wordpress-sg-dev" {
  vpc_id      = var.vpc_id
  name_prefix = "wordpress-sg-dev"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_autoscaling_group" "wordpress-as-dev" {
  launch_configuration = aws_launch_configuration.wordpress-lc-dev.id
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2
  vpc_zone_identifier  = [var.wordpress-public_subnetA-dev, var.wordpress-public_subnetB-dev]
}

resource "aws_alb" "wordpress-alb-dev" {
  name            = "wordpress-alb-dev"
  security_groups = [aws_security_group.wordpress-sg-dev.id]
  subnets         = [var.wordpress-public_subnetA-dev, var.wordpress-public_subnetB-dev]
  # listener {
  #   lb_port           = 80
  #   lb_protocol       = "http"
  #   instance_port     = 80
  #   instance_protocol = "http"
  # }
  # health_check {
  #   healthy_threshold   = 2
  #   unhealthy_threshold = 2
  #   timeout             = 3
  #   target              = "HTTP:80/"
  #   interval            = 30
  # }
}
