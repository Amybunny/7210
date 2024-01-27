provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "example" {
  ami = "ami-05a03e6058638183d"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-example"
  }
}