provider "aws" {
  region  = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  backend "s3" {
    bucket         = "jeremybucket-assignment3"
    key            = "terraform/state.tfstate"
    region         = "us-east-1"
    dynamodb_table = "jeremytable-assignment3"
    encrypt        = true
  }
}


resource "aws_instance" "appserver" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"
  key_name = "Jeremy-Charlie-East2"
  tags = {
    Name = "jeremyec2"
  }
}

#Security Group
resource "aws_security_group" "jeremy-sg" {
    name = "jeremy-sg"
    description = "Allow SSH, HHTP, and HTTPS, RDS"
    #vpc_id = aws_vpc.Jeremy-vpc.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }

     ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }

      ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }

        ingress {
        from_port = 5500
        to_port = 5500
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }
        
      ingress {
        from_port   = 3306              
        to_port     = 3306
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]    
      }

      egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }  
}    

output "ec2_instance_public_ip" {
    description = "The public IP address of the EC2 instance"
    value = aws_instance.appserver.public_ip
}


# resource "aws_dynamodb_table" "jeremytable-assignment3" {
#     hash_key = "LockID"
#     name = "jeremytable-assignment3"
#     attribute {
#         name = "LockID"
#         type = "S"
#     }
#     billing_mode = "PAY_PER_REQUEST"
# }