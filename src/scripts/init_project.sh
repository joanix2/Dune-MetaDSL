#!/bin/bash

# Vérifier si un nom de projet a été fourni
if [ -z "$1" ]; then
  echo "Usage: $0 <nom_du_projet>"
  exit 1
fi

PROJECT_NAME=$1
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Lancer les scripts d'initialisation
"$SCRIPT_DIR/init_angular.sh" "${PROJECT_NAME}-angular"
"$SCRIPT_DIR/init_dotnet.sh" "${PROJECT_NAME}-dotnet"

# Copier le template docker-compose et remplacer les placeholders
cp "$SCRIPT_DIR/templates/docker-compose.yml.template" "$SCRIPT_DIR/docker-compose.yml"
sed -i "s/@ANGULAR_PROJECT_NAME@/${PROJECT_NAME}-angular/g" "$SCRIPT_DIR/docker-compose.yml"
sed -i "s/@DOTNET_PROJECT_NAME@/${PROJECT_NAME}-dotnet/g" "$SCRIPT_DIR/docker-compose.yml"

# Copier les Dockerfiles dans les répertoires appropriés
cp "$SCRIPT_DIR/templates/Dockerfile.angular.template" "${PROJECT_NAME}-angular/Dockerfile"
cp "$SCRIPT_DIR/templates/Dockerfile.dotnet.template" "${PROJECT_NAME}-dotnet/Dockerfile"

# Remplacer les placeholders dans le Dockerfile .NET
sed -i "s/@PROJECT_NAME@/${PROJECT_NAME}-dotnet/g" "${PROJECT_NAME}-dotnet/Dockerfile"

echo "Initialisation de Docker terminée."
