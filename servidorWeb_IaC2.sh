#!/usr/bin/env bash

echo "Atualização do Servidor "

apt-get update
apt-get upgrade
apt-get install -y apache2 \
		   unzip \
		   wget

systemctl enable apache2
systemctl reload apache2
ufw allow in "Apache"
systemctl stop ufw && sudo systemctl start ufw

echo ""
echo "Baixando e Copiando os arquivos da Aplicação..."
cd /tmp 
wget https://github.com/sidneyojr/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
cd  linux-site-dio-main
cp -R * /var/www/html/

rm /tmp/main.zip
rm -rf /tmp/linux-site-dio-main/

echo ""
echo "Finalizado!!!!"
