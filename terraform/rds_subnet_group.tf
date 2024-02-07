resource "aws_db_subnet_group" "rds_subnet_group" {
    name       = "rds-subnet-group"
    subnet_ids = [for s in aws_subnet.public : s.id]

    tags = {
        Name = "RDS Subnet Group"
    }
}