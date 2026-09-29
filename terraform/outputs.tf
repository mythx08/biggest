output "vpc_id" {
  description = "ID du VPC principal"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs des sous-reseaux publics"
  value       = aws_subnet.public[*].id
}

output "security_group_id" {
  description = "ID du Security Group pour K3s"
  value       = aws_security_group.k3s_sg.id
}

output "master_public_ip" {
  description = "IP publique du noeud Master"
  value       = aws_instance.master.public_ip
}

output "worker_1_public_ip" {
  description = "IP publique du Worker 1"
  value       = aws_instance.worker_1.public_ip
}

output "worker_2_public_ip" {
  description = "IP publique du Worker 2"
  value       = aws_instance.worker_2.public_ip
}

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/inventory.ini.tpl", {
    master_ip   = aws_instance.master.public_ip
    worker_1_ip = aws_instance.worker_1.public_ip
    worker_2_ip = aws_instance.worker_2.public_ip
  })
  # Écrit directement le fichier final dans le dossier ansible/
  filename = "${path.module}/../ansible/inventory.ini"
}