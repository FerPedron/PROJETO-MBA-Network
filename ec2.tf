
data "aws_vpc" "projeto_vpc" {
  filter {
    name   = "tag:Name"
    values = ["PROJETO-MBA-VPC"]
  }
}


module "apache_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "apache-sg"
  description = "Security group para o servidor do Apache"
  vpc_id      = data.aws_vpc.projeto_vpc.id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "ssh-tcp"]
  egress_rules        = ["all-all"]
}



resource "aws_instance" "instancia_I" {
  ami                    = "ami-0b0dcb5067f052a63"
  instance_type          = "t2.micro"
  key_name               = "vockey"
  monitoring             = true
  vpc_security_group_ids = [module.apache_sg.security_group_id]
  subnet_id              = "subnet-0a6185b9c5eaa2fca"
  iam_instance_profile   = "LabInstanceProfile"
  user_data              = file("./dependencias_ec2.sh")


  tags = {
    Name = "Instancia-I"
    Zone = "us-east-1a"
  }

}


resource "aws_instance" "instancia_II" {
  ami                    = "ami-0b0dcb5067f052a63"
  instance_type          = "t2.micro"
  key_name               = "vockey"
  monitoring             = true
  vpc_security_group_ids = [module.apache_sg.security_group_id]
  subnet_id              = "subnet-0cf8fc8cb765d8e6e"
  iam_instance_profile   = "LabInstanceProfile"
  user_data              = file("./dependencias_ec2-II.sh")

  tags = {
    Name = "Instancia-II"
    Zone = "us-east-1b"
  }

}
