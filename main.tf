provider "aws"{
  region="ap-south-1"
}

resource "aws_instance" "nam-ec2"{
  ami="ami-0f5ee92e2d63afc18"
  instance_type="t2.micro"
  key_name = "mumbai-key"
  user_data                   = <<-EOF
      #!/bin/sh
      sudo apt-get update
      sudo apt install -y git
      sudo apt install -y docker.io
      
EOF
  tags={
    Name="terraform1"
  }
connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("mumbai-key.pem")
    host     = self.public_ip
  }
provisioner "file" {
    source      = "script.sh"
    destination = "/home/ubuntu/script.sh"
  }
provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /home/ubuntu/script.sh",
      "sh /home/ubuntu/script.sh",
    ]
  }
}
