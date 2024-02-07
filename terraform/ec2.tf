resource "aws_instance" "ubuntu_instance" {
    ami           = var.ami_id
    instance_type = var.instance_type
    key_name      = var.key_name


    user_data = <<-EOF
                #!/bin/bash

                # SKB SSH Port 22 -> 11117 Port로 변경 스크립트
                sed -i 's/#Port 22/Port 11117/g' /etc/ssh/sshd_config
                systemctl restart sshd

                # Docker Install
                apt-get update
                apt-get install -y docker.io
                sudo systemctl enable --now

                # Run Jenkins container
                docker run -d -p 8080:8080 -p 50000:50000 --name jenkins jenkins/jenkins:lts
                EOF

    root_block_device {
        volume_size = var.root_volume_size
    }

    tags = {
    Name = "App_Server"
    }
}
