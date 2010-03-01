#!/bin/bash
# Script for configure apache in my virtualbox Ubuntu 8.04 server

loadfile=/etc/apache2/mods-available/passenger.load
conffile=/etc/apache2/mods-available/passenger.conf
sitefile=/etc/apache2/sites-available/clube10

echo "LoadModule passenger_module /usr/lib/ruby/gems/1.8/gems/passenger-2.2.10/ext/apache2/mod_passenger.so" > $loadfile
echo "PassengerRoot /usr/lib/ruby/gems/1.8/gems/passenger-2.2.10" > $conffile
echo "PassengerRuby /usr/bin/ruby1.8" >> $conffile

echo "NameVirtualHost *:80" > $sitefile
echo "NameVirtualHost *:443" >> $sitefile
echo "<VirtualHost *:80>" >> $sitefile
echo "  ServerName clube10.local" >> $sitefile
echo "  DocumentRoot /home/administrador/clube10/public" >> $sitefile
echo "  <Directory /home/administrador/clube10/public>" >> $sitefile
echo "    AllowOverride all" >> $sitefile
echo "    Options -MultiViews" >> $sitefile
echo "  </Directory>" >> $sitefile
echo "</VirtualHost>" >> $sitefile
echo "<VirtualHost *:443>" >> $sitefile
echo "  ServerName clube10.local" >> $sitefile
echo "  DocumentRoot /home/administrador/clube10/public" >> $sitefile
echo "  <Directory /home/administrador/clube10/public>" >> $sitefile
echo "    AllowOverride all" >> $sitefile
echo "    Options -MultiViews" >> $sitefile
echo "  </Directory>" >> $sitefile
echo "  SSLEngine on" >> $sitefile
echo "  SSLCertificateFile /home/administrador/clube10/certs/clube10.local.crt" >> $sitefile
echo "  SSLCertificateKeyFile /home/administrador/clube10/certs/clube10.local.key" >> $sitefile
echo "</VirtualHost>" >> $sitefile
