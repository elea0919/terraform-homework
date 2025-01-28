resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  #availability_zone = "us-east-2c"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  key_name = aws_key_pair.deployer.key_name
  tags = {
    Name = "HelloWorld"
  }
}