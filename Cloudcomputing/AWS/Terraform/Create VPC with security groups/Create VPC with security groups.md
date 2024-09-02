Dont forget to first logon in the aws cli in CMD



```yaml
provider "aws" {
  region = "us-east-1"
}
# Create a VPC
resource "aws_vpc" "srv-vpc" {
  cidr_block = "10.1.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "srv-vpc"
  }
}
# Create an Internet Gateway
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.srv-vpc.id
}


# Create a route table
resource "aws_route_table" "main_route_table" {
  vpc_id = aws_vpc.srv-vpc.id
  route {
cidr_block = "0.0.0.0/0"
gateway_id = "${aws_internet_gateway.internet-gateway.id}"
}
}


# Create a private subnet-a
resource "aws_subnet" "subnet-a-1" {
  vpc_id     = aws_vpc.srv-vpc.id
  cidr_block = "10.1.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
    tags = {
    Name = "subnet-a-1"
  }
}
resource "aws_subnet" "subnet-a-2" {
  vpc_id     = aws_vpc.srv-vpc.id
  cidr_block = "10.1.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
    tags = {
    Name = "subnet-a-2"
  }
}
resource "aws_subnet" "subnet-a-3" {
  vpc_id     = aws_vpc.srv-vpc.id
  cidr_block = "10.1.3.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
    tags = {
    Name = "subnet-a-3"
  }
}

# Create a private subnet-b
resource "aws_subnet" "subnet-b-1" {
  vpc_id     = aws_vpc.srv-vpc.id
  cidr_block = "10.1.4.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"
    tags = {
    Name = "subnet-b-1"
  }
}
resource "aws_subnet" "subnet-b-2" {
  vpc_id     = aws_vpc.srv-vpc.id
  cidr_block = "10.1.5.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"
    tags = {
    Name = "subnet-b-2"
  }
}
resource "aws_subnet" "subnet-b-3" {
  vpc_id     = aws_vpc.srv-vpc.id
  cidr_block = "10.1.6.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"
    tags = {
    Name = "subnet-b-3"
  }
}

# Create a private subnet-c
resource "aws_subnet" "subnet-c-1" {
  vpc_id     = aws_vpc.srv-vpc.id
  cidr_block = "10.1.7.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1c"
    tags = {
    Name = "subnet-c-1"
  }
}
resource "aws_subnet" "subnet-c-2" {
  vpc_id     = aws_vpc.srv-vpc.id
  cidr_block = "10.1.8.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1c"
    tags = {
    Name = "subnet-c-2"
  }
}
resource "aws_subnet" "subnet-c-3" {
  vpc_id     = aws_vpc.srv-vpc.id
  cidr_block = "10.1.9.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1c"
    tags = {
    Name = "subnet-c-3"
  }
}

# Create a private subnet-d
resource "aws_subnet" "subnet-d-1" {
  vpc_id     = aws_vpc.srv-vpc.id
  cidr_block = "10.1.10.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1d"
    tags = {
    Name = "subnet-d-1"
  }
}
resource "aws_subnet" "subnet-d-2" {
  vpc_id     = aws_vpc.srv-vpc.id
  cidr_block = "10.1.11.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1d"
    tags = {
    Name = "subnet-d-2"
  }
}
resource "aws_subnet" "subnet-d-3" {
  vpc_id     = aws_vpc.srv-vpc.id
  cidr_block = "10.1.12.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1d"
    tags = {
    Name = "subnet-d-3"
  }
}

# Create a private subnet-e
resource "aws_subnet" "subnet-e-1" {
  vpc_id     = aws_vpc.srv-vpc.id
  cidr_block = "10.1.13.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1e"
    tags = {
    Name = "subnet-e-1"
  }
}
resource "aws_subnet" "subnet-e-2" {
  vpc_id     = aws_vpc.srv-vpc.id
  cidr_block = "10.1.14.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1e"
    tags = {
    Name = "subnet-e-2"
  }
}
resource "aws_subnet" "subnet-e-3" {
  vpc_id     = aws_vpc.srv-vpc.id
  cidr_block = "10.1.15.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1e"
    tags = {
    Name = "subnet-e-3"
  }
}

# Create a private subnet-f
resource "aws_subnet" "subnet-f-1" {
  vpc_id     = aws_vpc.srv-vpc.id
  cidr_block = "10.1.16.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1f"
    tags = {
    Name = "subnet-f-1"
  }
}
resource "aws_subnet" "subnet-f-2" {
  vpc_id     = aws_vpc.srv-vpc.id
  cidr_block = "10.1.17.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1f"
    tags = {
    Name = "subnet-f-2"
  }
}
resource "aws_subnet" "subnet-f-3" {
  vpc_id     = aws_vpc.srv-vpc.id
  cidr_block = "10.1.18.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1f"
    tags = {
    Name = "subnet-f-3"
  }
}

#assosiate route with subnet
resource "aws_route_table_association" "Connect-subnet-a-1" {
subnet_id = "${aws_subnet.subnet-a-1.id}"
route_table_id = "${aws_route_table.main_route_table.id}"
}

resource "aws_route_table_association" "Connect-subnet-a-2" {
subnet_id = "${aws_subnet.subnet-a-2.id}"
route_table_id = "${aws_route_table.main_route_table.id}"
}

resource "aws_route_table_association" "Connect-subnet-a-3" {
subnet_id = "${aws_subnet.subnet-a-3.id}"
route_table_id = "${aws_route_table.main_route_table.id}"
}


resource "aws_route_table_association" "Connect-subnet-b-1" {
subnet_id = "${aws_subnet.subnet-b-1.id}"
route_table_id = "${aws_route_table.main_route_table.id}"
}

resource "aws_route_table_association" "Connect-subnet-b-2" {
subnet_id = "${aws_subnet.subnet-b-2.id}"
route_table_id = "${aws_route_table.main_route_table.id}"
}

resource "aws_route_table_association" "Connect-subnet-b-3" {
subnet_id = "${aws_subnet.subnet-b-3.id}"
route_table_id = "${aws_route_table.main_route_table.id}"
}




resource "aws_route_table_association" "Connect-subnet-c-1" {
subnet_id = "${aws_subnet.subnet-c-1.id}"
route_table_id = "${aws_route_table.main_route_table.id}"
}

resource "aws_route_table_association" "Connect-subnet-c-2" {
subnet_id = "${aws_subnet.subnet-c-2.id}"
route_table_id = "${aws_route_table.main_route_table.id}"
}

resource "aws_route_table_association" "Connect-subnet-c-3" {
subnet_id = "${aws_subnet.subnet-c-3.id}"
route_table_id = "${aws_route_table.main_route_table.id}"
}





resource "aws_route_table_association" "Connect-subnet-d-1" {
subnet_id = "${aws_subnet.subnet-d-1.id}"
route_table_id = "${aws_route_table.main_route_table.id}"
}

resource "aws_route_table_association" "Connect-subnet-d-2" {
subnet_id = "${aws_subnet.subnet-d-2.id}"
route_table_id = "${aws_route_table.main_route_table.id}"
}

resource "aws_route_table_association" "Connect-subnet-d-3" {
subnet_id = "${aws_subnet.subnet-d-3.id}"
route_table_id = "${aws_route_table.main_route_table.id}"
}






resource "aws_route_table_association" "Connect-subnet-e-1" {
subnet_id = "${aws_subnet.subnet-e-1.id}"
route_table_id = "${aws_route_table.main_route_table.id}"
}

resource "aws_route_table_association" "Connect-subnet-e-2" {
subnet_id = "${aws_subnet.subnet-e-2.id}"
route_table_id = "${aws_route_table.main_route_table.id}"
}

resource "aws_route_table_association" "Connect-subnet-e-3" {
subnet_id = "${aws_subnet.subnet-e-3.id}"
route_table_id = "${aws_route_table.main_route_table.id}"
}




resource "aws_route_table_association" "Connect-subnet-f-1" {
subnet_id = "${aws_subnet.subnet-f-1.id}"
route_table_id = "${aws_route_table.main_route_table.id}"
}

resource "aws_route_table_association" "Connect-subnet-f-2" {
subnet_id = "${aws_subnet.subnet-f-2.id}"
route_table_id = "${aws_route_table.main_route_table.id}"
}

resource "aws_route_table_association" "Connect-subnet-f-3" {
subnet_id = "${aws_subnet.subnet-f-3.id}"
route_table_id = "${aws_route_table.main_route_table.id}"
}







# Create a security group
resource "aws_security_group" "SSH" {
  name        = "SSH"
  description = "SSH Port 22 Open"
  vpc_id      = aws_vpc.srv-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}




resource "aws_security_group" "http" {
  name        = "HTTP"
  description = "HTTP Port 80 Open"
  vpc_id      = aws_vpc.srv-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "https" {
  name        = "HTTPS"
  description = "HTTPS Port 443 Open"
  vpc_id      = aws_vpc.srv-vpc.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "no-ingress" {
  name        = "NO-INGRESS"
  description = "All Ports closed"
  vpc_id      = aws_vpc.srv-vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "open-ingress" {
  name        = "OPEN-INGRESS"
  description = "All Ports open"
  vpc_id      = aws_vpc.srv-vpc.id

  ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}





resource "aws_security_group" "loadbalancer" {
  name        = "LoadBalancer-HTTP-HTTPS"
  description = "Application Loadbalancer Port 80 and 443 open"
  vpc_id      = aws_vpc.srv-vpc.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_security_group" "http-by-loadbalancer" {
  name        = "HTTP by LoadBalancer"
  description = "Allows connections from the Securitygroup of the Loadbalancer"
  vpc_id      = aws_vpc.srv-vpc.id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = ["${aws_security_group.loadbalancer.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```
