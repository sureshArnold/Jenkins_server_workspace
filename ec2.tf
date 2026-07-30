
resource "aws_key_pair" "this" {
  count      = var.custom_key_pair_name != "" ? 1 : 0
  key_name   = var.custom_key_pair_name
  public_key = file("${path.module}/keys/${var.custom_key_pair_name}.pub")
}

resource "aws_instance" "jenkins" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.custom_key_pair_name != "" ? var.custom_key_pair_name : null

  root_block_device {
    volume_size           = var.root_volume.volume_size
    volume_type           = var.root_volume.volume_type
    delete_on_termination = var.root_volume.delete_on_termination
  }

  vpc_security_group_ids = [aws_security_group.jenkins[0].id]

  user_data =  file("${path.module}/templates/user_data_jenkins.tpl")

  tags = {
    Name = var.Instance_name
  }
}

resource "aws_eip" "jenkins" {
  count = var.is_public ? 1 : 0
  instance = aws_instance.jenkins.id
}

