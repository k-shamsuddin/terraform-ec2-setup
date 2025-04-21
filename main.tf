provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0c02fb55956c7d316" # Amazon linuc 2 freetier
  instance_type = "t2.micro"
  key_name      =  "terrakey"

   user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Hello from Terraform, by shams!" > /var/www/html/index.html
              EOF

  tags = {
    Name = "terraformEC2"
  }
}

