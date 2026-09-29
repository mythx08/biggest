# Stratégie de Registre et Cycle de Vie des Images Conteneurs

## 1. Choix du Registre
* **Registre sélectionné :** Docker Hub (`docker.io/mythx08`)
* **Justification :** Simplicité d'intégration directe avec K3s sans configuration d'IAM role ou de jetons temporaires AWS STS requis par AWS ECR, tout en restant strictement dans le cadre de la gratuité (budget 0 USD).

## 2. Convention de Versioning et Taggage
* **Règle :** Utilisation stricte du versioning sémantique (`MAJOR.MINOR.PATCH`, ex: `1.0.0`).
* **Interdiction :** L'usage du tag mutable `:latest` est proscrit pour les déploiements afin de garantir la reproductibilité et d'éviter les incohérences de cache sur les nœuds de calcul.
* **Traçabilité CI (Phases futures) :** Chaque build automatisé associera également un tag basé sur le SHA court du commit Git (`git rev-parse --short HEAD`).

## 3. Politique de Sécurité
* Scan automatique des CVE avec Trivy avant tout déploiement.
* Blocage du pipeline CI si une vulnérabilité de sévérité CRITICAL est détectée.
