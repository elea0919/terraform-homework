provider aws {
    region = "eu-central-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "Bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20250116.0-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Canonical
}



resource "aws_instance" "web-1" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  # availability_zone = "eu-central-1a"
  subnet_id = "subnet-0c286a31d06ddefc0"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_instance" "web-2" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
 # availability_zone = "eu-central-1b"
  subnet_id = "subnet-08955e0da6fc9951a"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_instance" "web-3" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  # availability_zone = "eu-central-1c"
  subnet_id = "subnet-029f43bc86d13d828"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")

  tags = {
    Name = "HelloWorld"
  }
}

output ec2 {
  value = aws_instance.web-1.public_ip
  sensitive = false
}

output ami {
  value = aws_instance.web-1.ami
  sensitive = false
}