variable "aws_region" {
  default = "us-east-1"
}

variable "my_ip" {
  description = "Your public IP for SSH access"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}
