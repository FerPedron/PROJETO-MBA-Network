
resource "aws_instance" "instancia_I" {
  ami           = "ami-08d4ac5b634553e16"
  instance_type = "t3.micro"
  key_name      = "vockey"
  subnet_id     = "subnet-0a6185b9c5eaa2fca"

  tags = {
    Name = "Instancia-I"
    Zone = "us-east-1a"
  }

}


resource "aws_instance" "instancia_II" {
  ami           = "ami-08d4ac5b634553e16"
  instance_type = "t3.micro"
  key_name      = "vockey"
  subnet_id     = "subnet-0cf8fc8cb765d8e6e"

  tags = {
    Name = "Instancia-II"
    Zone = "us-east-1b"
  }

}