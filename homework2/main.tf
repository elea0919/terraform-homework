provider aws {
    region = "eu-central-1"
}
  
resource "aws_key_pair" "Bastion-key" {
    key_name = "Bastion-key"
    public_key = file ("~/.ssh/id_rsa.pub")
}


resource "aws_s3_bucket" "example" {
  bucket = "kaizen-elea"
}

resource "aws_s3_bucket" "manual" {
  bucket = "kaizen-elea2"
}

resource "aws_s3_bucket" "manual2" {
  bucket = "kaizen-elea3"
}