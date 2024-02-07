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
