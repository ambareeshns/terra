provider "aws"{
  region="ap-south-1"
}

resource "aws_instance" "nam-ec2"{
  ami="ami-0dce6c913521d629e"
  instance_type="t2.micro"
  tags={
    Name="terraform"
  }
}
