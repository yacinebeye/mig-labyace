# create security group for the application load balancer in the private subnet
resource "aws_security_group" "private_alb_security_group" {
  name        = "private alb security group"
  description = "Load Balance the traffic with the private subnets"
  vpc_id      = var.vpc_id

  ingress {
    description      = "allow ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # or my IP 24.126.209.1/32
  }

  ingress {
    description      = "http access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # or my IP 24.126.209.1/32
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"] 
  }

  tags   = {
    Name = "alb private subnet security group"
  }
}


# create security group for the application load balancer in the public subnet 
resource "aws_security_group" "public_alb_security_group" {
  name        = "public alb security group"
  description = "Load Balance the traffic with the public subnets"
  vpc_id      = var.vpc_id

  ingress {
    description      = "allow ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # or my IP 24.126.209.1/32
  }

  ingress {
    description      = "http access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # or my IP 24.126.209.1/32
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    Name = "alb public subnet security group"
  }
}


# create security group for the linux servers 
resource "aws_security_group" "linux_security_group" {
  name        = "linux server security group"
  description = "allow access to the servers with ssh"

#   ingress {
#     description      = "http access"
#     from_port        = 80
#     to_port          = 80
#     protocol         = tcp
#     security_groups  = ["0.0.0.0/0"] # or my IP 24.126.209.1/32
  # }

  ingress {
    description      = "allow ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups  = ["0.0.0.0/0"] # or my IP 24.126.209.1/32
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    Name = " Linux servers security group"
  }
}

# create security group for the Windows servers 
resource "aws_security_group" "windows_security_group" {
  name        = "linux server security group"
  description = "allow access to the servers with rdp"
  vpc_id      = var.vpc_id

  ingress {
    description      = "allow access through rdp"
    from_port        = 3389
    to_port          = 3389
    protocol         = "tcp"
    security_groups  = ["0.0.0.0/0"] # or my IP 24.126.209.1/32
  }

#   ingress {
#     description      = "https access"
#     from_port        = 
#     to_port          = 
#     protocol         = 
#     security_groups  = 
#   }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    Name = " Windows servers security group"
  }
}