#!/bin/bash
# Script for configure apache in my virtualbox Ubuntu 8.04 server
echo "LoadModule passenger_module /usr/lib/ruby/gems/1.8/gems/passenger-2.2.10/ext/apache2/mod_passenger.so" > /etc/apache2/mods-available/passenger.load
echo "PassengerRoot /usr/lib/ruby/gems/1.8/gems/passenger-2.2.10" > /etc/apache2/mods-available/passenger.conf
echo "PassengerRuby /usr/bin/ruby1.8" >> /etc/apache2/mods-available/passenger.conf

echo "<VirtualHost *:80>" > /etc/apache2/mods-available/clube10.conf
echo "  ServerName clube10.local" >> /etc/apache2/mods-available/clube10.conf
echo "  DocumentRoot /home/administrador/clube10/public" >> /etc/apache2/mods-available/clube10.conf
echo "  <Directory /home/administrador/clube10/public>" >> /etc/apache2/mods-available/clube10.conf
echo "    AllowOverride all" >> /etc/apache2/mods-available/clube10.conf
echo "    Options -MultiViews" >> /etc/apache2/mods-available/clube10.conf
echo "  </Directory>" >> /etc/apache2/mods-available/clube10.conf
echo "</VirtualHost>" >> /etc/apache2/mods-available/clube10.conf

echo "<VirtualHost *:443>" > /etc/apache2/mods-available/clube10.conf
echo "  ServerName clube10.local" >> /etc/apache2/mods-available/clube10.conf
echo "  DocumentRoot /home/administrador/clube10/public" >> /etc/apache2/mods-available/clube10.conf
echo "  <Directory /home/administrador/clube10/public>" >> /etc/apache2/mods-available/clube10.conf
echo "    AllowOverride all" >> /etc/apache2/mods-available/clube10.conf
echo "    Options -MultiViews" >> /etc/apache2/mods-available/clube10.conf
echo "  </Directory>" >> /etc/apache2/mods-available/clube10.conf
echo "  SSLEngine on" >> /etc/apache2/mods-available/clube10.conf
echo "  SSLCertificateFile /home/administrador/clube10/certs/clube10.local.crt" >> /etc/apache2/mods-available/clube10.conf
echo "  SSLCertificateKeyFile /home/administrador/clube10/certs/clube10.local.key" >> /etc/apache2/mods-available/clube10.conf
echo "</VirtualHost>" >> /etc/apache2/mods-available/clube10.conf
