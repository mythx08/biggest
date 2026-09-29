FROM nginx:alpine

# Mise à jour des paquets système pour combler la CVE de libexpat
RUN apk update && apk upgrade --no-cache

COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
