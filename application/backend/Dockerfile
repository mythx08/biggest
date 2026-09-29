# Étape 1 : Construction et installation des dépendances
FROM node:20-alpine AS builder

WORKDIR /app
COPY package*.json ./
RUN npm install --omit=dev

# Étape 2 : Image d'exécution minimale
FROM node:20-alpine

WORKDIR /app

# Mise à jour des librairies système (pour corriger libcrypto3, libssl3)
RUN apk update && apk upgrade --no-cache && \
    rm -rf /usr/local/lib/node_modules/npm /usr/local/bin/npm /usr/local/bin/npx /opt/yarn*

# Création d'un utilisateur non-root
USER node

# Copie des artefacts depuis l'étape de build
COPY --chown=node:node --from=builder /app/node_modules ./node_modules
COPY --chown=node:node server.js ./
COPY --chown=node:node package.json ./

EXPOSE 5000
CMD ["node", "server.js"]
