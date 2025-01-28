provider aws {
    region = var.region 
  
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_rsa.pub")
}




output "web" {
  value     = aws_instance.web.public_ip
  sensitive = true
}