
resource "aws_instance" "instancia_I" {
  ami                  = "ami-01a73f51321ab6899"
  instance_type        = "t3.micro"
  key_name             = "vockey"
  subnet_id            = "subnet-0a6185b9c5eaa2fca"
  iam_instance_profile = "LabInstanceProfile"
  user_data            = file("./dependencias_ec2.sh")


  tags = {
    Name = "Instancia-I"
    Zone = "us-east-1a"
  }

}


resource "aws_instance" "instancia_II" {
  ami           = "ami-01a73f51321ab6899"
  instance_type = "t3.micro"
  key_name      = "vockey"
  subnet_id     = "subnet-0cf8fc8cb765d8e6e"

  tags = {
    Name = "Instancia-II"
    Zone = "us-east-1b"
  }

}
