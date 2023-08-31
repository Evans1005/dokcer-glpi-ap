#!/bin/bash

cd /var/www/
if [ ! -f /var/www/glpi/index.php ];
then
wget https://github.com/glpi-project/glpi/releases/download/10.0.9/glpi-10.0.9.tgz
tar -zxf glpi-10.0.9.tgz
rm glpi-10.0.9.tgz
chmod 755 -R /var/www/glpi
chown www-data:www-data -R /var/www/glpi
fi
service apache2 start
tail -f /dev/null
