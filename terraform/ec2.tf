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

resource "aws_security_group" "ec2_security_group" {
    vpc_id = aws_vpc.main_vpc.id

    #기본 ssh Port
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    # SKB Internet Port
    ingress {
        from_port   = 11117
        to_port     = 11117
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }


    # jenkins Port
    ingress {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    
    #http Port
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "ec2-security-group"
    }
}

