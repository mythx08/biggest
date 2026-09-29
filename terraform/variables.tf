variable "aws_region" {
  description = "Region AWS pour le deploiement de l'infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "Plage CIDR pour le VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Plages CIDR pour les sous-reseaux publics"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "availability_zones" {
  description = "Zones de disponibilite pour la repartition multi-AZ"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "instance_type" {
  description = "Type d'instance EC2 pour les nœuds K3s"
  type        = string
  default     = "t3.small" # Recommandé pour K3s + monitoring / Free Tier éligible selon vos quotas
}

variable "ssh_public_key_path" {
  description = "Chemin local vers la cle publique SSH"
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
}