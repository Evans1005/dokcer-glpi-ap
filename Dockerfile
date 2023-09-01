FROM ubuntu
MAINTAINER Evans

RUN apt update
RUN export DEBIAN_FRONTEND=noninteractive
RUN apt install tzdata -y
RUN ln -fs /usr/share/zoneinfo/Asia/Taipei /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata
RUN apt install php php-mysql php-gd php-curl php-common php-cli php-ldap php-bz2 php-zip php-mbstring php-xml php-json php-intl nano wget -y

ADD glpi.sh /opt/
ADD glpi.conf /etc/apache2/sites-available/
RUN mv /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.bak
RUN a2ensite glpi
RUN a2enmod rewrite

CMD ["bash","-c","sh /opt/glpi.sh"]