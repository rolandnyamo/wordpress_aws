resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = ["${aws_subnet.priv_a.id}", "${aws_subnet.priv_b.id}"]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "default" {
  identifier           = "wordpress"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = ""
  password             = ""
  parameter_group_name = "default.mysql5.7"
  db_subnet_group_name = "${aws_db_subnet_group.default.name}"
}
