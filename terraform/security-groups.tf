# Variable for administrator public IP (SSH / API)
variable "admin_ip" {
  description = "Your public IP in CIDR notation (e.g., 196.xxx.xxx.xxx/32) for secure administrative access"
  type        = string
  default     = "196.200.133.184/32" # Replace with your actual IP/32 to satisfy least privilege
}

resource "aws_security_group" "k3s_sg" {
  name        = "biggest-k3s-sg"
  description = "Security group for K3s control-plane and worker nodes"
  vpc_id      = aws_vpc.main.id

  # ---------------------------------------------------------------------------
  # Administrative Access
  # ---------------------------------------------------------------------------

  # SSH access for administration and Ansible provisioning
  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.admin_ip]
  }

  # Kubernetes API Server (kubectl)
  ingress {
    description = "K3s supervisor and Kubernetes API Server"
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = [var.admin_ip]
  }

  # ---------------------------------------------------------------------------
  # Application Traffic (Ingress Controller)
  # ---------------------------------------------------------------------------

  # HTTP Ingress (Traefik)
  ingress {
    description = "HTTP web traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS Ingress (Traefik)
  ingress {
    description = "HTTPS web traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # ---------------------------------------------------------------------------
  # Intra-Cluster Communication (Node-to-Node)
  # ---------------------------------------------------------------------------

  # Allow all internal traffic between nodes sharing this security group
  # Covers: Flannel VXLAN (UDP 8472), Kubelet API (TCP 10250), CoreDNS, Kine/SQLite
  ingress {
    description = "Intra-cluster communication among K3s nodes"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  # ---------------------------------------------------------------------------
  # Egress
  # ---------------------------------------------------------------------------

  # Outbound access to the internet for package installations, container image pulls
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "biggest-k3s-sg"
  }
}