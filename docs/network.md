# Network Architecture & Addressing Plan

## VPC
- **CIDR**: `10.0.0.0/16`
- **Region**: Choisi selon votre configuration CLI (ex: `eu-west-3` ou `us-east-1`)
- **DNS Hostnames**: Activé
- **DNS Support**: Activé

## Subnets
- `public-subnet-1`: `10.0.1.0/24` (AZ: `a`)
- `public-subnet-2`: `10.0.2.0/24` (AZ: `b`)

## Routing
- Route Table Publique : `0.0.0.0/0` vers l'Internet Gateway (IGW)

## Security Controls (Base)
- **k3s-sg** :
  - Ingress : Port 22 (SSH) restreint à votre IP publique.
  - Ingress : Port 6443 (API Kubernetes K3s) restreint.
  - Ingress : Port 80/443 (HTTP/HTTPS Ingress applicatif).
  - Egress : `0.0.0.0/0` (toutes sorties autorisées pour les packages et images).
