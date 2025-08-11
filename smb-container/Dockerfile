FROM ubuntu:25.04

# Installer les outils nécessaires
RUN apt-get update && \
    apt-get install -y cifs-utils curl && \
    apt-get clean

# Créer le dossier de montage
RUN mkdir -p /mnt/share

# Copier le script de montage
COPY mount-share.sh /usr/local/bin/mount-share.sh
RUN chmod +x /usr/local/bin/mount-share.sh

# Point d'entrée
CMD ["/usr/local/bin/mount-share.sh"]
