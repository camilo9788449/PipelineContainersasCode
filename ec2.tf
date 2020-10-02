/*----------------------------------------
Define the EC2 Instance
----------------------------------------*/
resource "aws_instance" "Demo-public" {
  ami           = "ami-0dba2cb6798deb6d8"
  instance_type = "t2.micro"
  count = 2
  key_name = "llave-ec2"
  vpc_security_group_ids = ["sg-00b5d020df03cc6c3"]
  tags = {
    Name = "Terraform - public"
  }
}
resource "aws_instance" "Demo-private" {
  ami           = "ami-0dba2cb6798deb6d8"
  instance_type = "t2.micro"
  key_name = "llave-ec2"
  vpc_security_group_ids = ["${aws_security_group.securityG.id}"]
  subnet_id = "${aws_subnet.sb_demo1.id}"
  tags = {
    Name = "Terraform - private"
  }
}

