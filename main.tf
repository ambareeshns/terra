provider "aws"{
  region="ap-south-1"
}

resource "aws_instance" "nam-ec2"{
  ami="ami-0dce6c913521d629e"
  instance_type="t2.micro"
  user_data                   = <<-EOF
      #!/bin/sh
      sudo apt-get update
      sudo apt install -y git
      sudo apt install -y docker.io
      sudo apt install -y maven
EOF
  tags={
    Name="terraform"
  }
}
