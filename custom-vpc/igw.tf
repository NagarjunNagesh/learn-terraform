resource "aws_internet_gateway" "MyIGW" {
    vpc_id = "${aws_vpc.main.id}"
    tags =  {
        Name = "MyInternetGateway"
    }
}

resource "aws_route_table" "publicrt" {
    vpc_id = "${aws_vpc.main.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.MyIGW.id}"
    }
    tags = {
        Name = "PublicRouteTable"
    }
}

resource "aws_route_table" "privatert" {
    vpc_id = "${aws_vpc.main.id}"
    tags = {
        Name = "PrivateRouteTable"
    }
}

resource "aws_route_table_association" "public-association"{
    subnet_id = "${aws_subnet.public-subnet.id}"
    route_table_id = "${aws_route_table.publicrt.id}"
}

resource "aws_route_table_association" "private-association"{
    subnet_id = "${aws_subnet.private-subnet.id}"
    route_table_id = "${aws_route_table.privatert.id}"
}