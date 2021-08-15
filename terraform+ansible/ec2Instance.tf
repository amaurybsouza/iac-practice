resource "aws_instance" "server" {
  ami                         = "ami-09e67e426f25ce0d7"
  subnet_id                   = "subnet-cb298bfa"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  security_groups             = [aws_security_group.server.id]
  key_name                    = local.key_name

provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]

     connection {
      type        = "ssh"
      user        = local.ssh_user
      private_key = file(local.private_key_path)
      host        = aws_instance.server.public_ip
    }
}

provisioner "local-exec" {
    command = "ansible-playbook  -i ${aws_instance.server.public_ip}, --private-key ${local.private_key_path} nmap.yml"

}
}

output "server_ip" {
  value = aws_instance.server.public_ip
 connection {
      type        = "ssh"
      user        = local.ssh_user
      private_key = file(local.private_key_path)
      host        = aws_instance.server.public_ip
    }
}
