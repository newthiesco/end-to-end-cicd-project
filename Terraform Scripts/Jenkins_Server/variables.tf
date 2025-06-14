variable "vpc_id" {
  type    = string
  default = "vpc-06c6daa6eee345087"
}
variable "region" {
  type    = string
  default = "us-east-1"
}
variable "my_instance_type" {
  type    = string
  default = "t2.medium"
}


variable "my_key" {
  description = "AWS EC2 Key pair that needs to be associated with EC2 Instance"
  type        = string
  default     = "devops_keys"
}

variable "ingressrules" {
  type    = list(number)
  default = [22, 80, 443, 8080, 8090, 9000, 8081, 2479]
}

variable "egressrules" {
  type    = list(number)
  default = [25, 80, 443, 8080, 8090, 3306, 53]
}


#Instance type as a map variable
variable "my_instance_type_map" {
  description = "EC2 instance type"
  type        = map(string)
  default = {
    "dev"  = "t2.micro"
    "qa"   = "t2.medium"
    "prod" = "t3.large"
  }
}
