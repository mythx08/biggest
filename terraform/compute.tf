# Clé SSH publique injectée dans les instances
resource "aws_key_pair" "k3s_key" {
  key_name   = "biggest-k3s-key"
  public_key = file(var.ssh_public_key_path)
}

# Recherche dynamique de la dernière AMI officielle Ubuntu 22.04 LTS
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# -----------------------------------------------------------------------------
# Control Plane (Master) - Subnet 1 (AZ a)
# -----------------------------------------------------------------------------
resource "aws_instance" "master" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public[0].id
  vpc_security_group_ids = [aws_security_group.k3s_sg.id]
  key_name               = aws_key_pair.k3s_key.key_name

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = "biggest-k3s-master"
    Role = "control-plane"
  }
}

# -----------------------------------------------------------------------------
# Worker 1 - Subnet 1 (AZ a)
# -----------------------------------------------------------------------------
resource "aws_instance" "worker_1" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public[0].id
  vpc_security_group_ids = [aws_security_group.k3s_sg.id]
  key_name               = aws_key_pair.k3s_key.key_name

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = "biggest-k3s-worker-1"
    Role = "worker"
  }
}

# -----------------------------------------------------------------------------
# Worker 2 - Subnet 2 (AZ b)
# -----------------------------------------------------------------------------
resource "aws_instance" "worker_2" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public[1].id
  vpc_security_group_ids = [aws_security_group.k3s_sg.id]
  key_name               = aws_key_pair.k3s_key.key_name

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = "biggest-k3s-worker-2"
    Role = "worker"
  }
}