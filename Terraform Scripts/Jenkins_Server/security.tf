# Create Security Group - SSH Traffic and other ports
resource "aws_security_group" "web_traffic" {
  name        = "My_Security_Group1"
  description = "Allow web and SSH traffic"
  vpc_id      = var.vpc_id # Make sure you define this variable or hardcode if needed

  dynamic "ingress" {
    for_each = var.ingressrules
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.egressrules
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "My_SG1"
  }
}
