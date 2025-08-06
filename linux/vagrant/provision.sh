#!/bin/bash

# Actualizar lista de paquetes
sudo apt update

# Instalar utilidades básicas
sudo apt install -y curl wget unzip git net-tools htop tree

# Instalar servidor Apache
sudo apt install -y apache2
sudo systemctl enable apache2
sudo systemctl start apache2

# Mostrar mensaje de confirmación
echo "Provisioning completado: herramientas instaladas y Apache configurado"


#Explicación:
# Este script instala:
#	 Herramientas útiles para entornos DevOps: curl, wget, git, net-tools, htop, tree
#    Servidor web Apache, lo habilita al arranque y lo inicia
#    Finaliza mostrando un mensaje de confirmación
