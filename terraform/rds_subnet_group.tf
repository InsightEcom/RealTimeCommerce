resource "aws_db_subnet_group" "rds_subnet_group" {
    name       = "rds-subnet-group"
    subnet_ids = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]

    tags = {
        Name = "RDS Subnet Group"
    }
}