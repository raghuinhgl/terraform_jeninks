resource "aws_instance" "test123" {
  ami= "ami-0b614a5d911900a9b"
  instance_type = "t2.micro"


tags= {
    Name="my-test-jenkins"
      }
}
