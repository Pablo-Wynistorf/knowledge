```yaml
provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "ssh-key" {
    content  = tls_private_key.rsa.private_key_pem
    filename = "ssh.pem"
}
```
