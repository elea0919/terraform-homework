provider aws {
    region = var.region
}

variable region {
    default = "us-east-1"
  
}

variable instance_type {
    default = "t2.micro"
  
}
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] 
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  user_data = file("apache.sh")

  tags = {
    Name = "Homework5"
  }
}

output ec2 {
    value = aws_instance.web.public_ip
    sensitive = true
}