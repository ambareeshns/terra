provider "aws"{
  region="ap-south-1"
}

resource "aws_instance" "nam-ec2"{
  ami="ami-0f5ee92e2d63afc18"
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
connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("")
    host     = self.public_ip
  }
provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
}
