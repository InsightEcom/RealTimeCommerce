resource "aws_instance" "ubuntu_instance" {
    ami           = var.ami_id
    instance_type = var.instance_type
    key_name      = var.key_name


    # SKB SSH Port 22 -> 11117 Port로 변경 스크립트
    # user_data = <<-EOF
    #             #!/bin/bash
    #             sed -i 's/#Port 22/Port 11117/g' /etc/ssh/sshd_config
    #             systemctl restart sshd
    #             EOF

    root_block_device {
        volume_size = var.root_volume_size
    }

    tags = {
    Name = "App_Server"
    }
}
