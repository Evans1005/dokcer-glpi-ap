FROM evans1005/ubuntu_php
MAINTAINER Evans

RUN apt install wget -y
ADD glpi.sh /opt/
ADD glpi.conf /etc/apache2/sites-available/
RUN mv /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.bak
RUN a2ensite glpi
RUN a2enmod rewrite
EXPOSE 80
CMD ["bash","-c","sh /opt/glpi.sh"]