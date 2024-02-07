resource "aws_subnet" "public" {
    for_each = var.public_subnets

    vpc_id            = aws_vpc.main_vpc.id
    cidr_block        = each.value
    availability_zone = "${var.region}${each.key[-1]}"

    tags = {
        Name = each.key
    }
}

resource "aws_subnet" "private" {
    for_each = var.private_subnets

    vpc_id            = aws_vpc.main_vpc.id
    cidr_block        = each.value
    availability_zone = "${var.region}${each.key[-1]}"

    tags = {
        Name = each.key
    }
}

resource "aws_subnet" "rds" {
    for_each = var.rds_subnets

    vpc_id            = aws_vpc.main_vpc.id
    cidr_block        = each.value
    availability_zone = "${var.region}${each.key[-1]}"

    tags = {
        Name = each.key
    }
}
