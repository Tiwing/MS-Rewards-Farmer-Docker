# Utiliser l'image de base de Python
FROM python:3.9-slim

# Set la time zone Paris
ENV TZ=Europe/Paris

# Definir le repertoire de travail
WORKDIR /app

# Copier uniquement le fichier des besoins pour profiter de la mémoire cache
COPY requirements.txt .

# # Installer les paquets necessaires, Chromium, chromedriver, libffi-dev, curl, pkg-config et libssl-dev
RUN apt-get update -qqy \
    && apt-get install -qqy curl chromium chromium-driver libffi-dev pkg-config libssl-dev \
    libx11-6 libx11-xcb1 libfontconfig1 libfreetype6 libxext6 libxrender1 libxtst6 libnss3 libnspr4 libasound2 \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# Installer les dependances du projet Python
RUN pip install -r requirements.txt

# Copier le reste des fichiers du projet dans le repertoire de travail
COPY . .
