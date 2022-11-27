FROM ubuntu:latest

RUN apt update && apt upgrade -y
RUN apt install curl apache2 apache2-utils libapache2-mod-bw -y
RUN apt clean

# Enable apache modules
RUN a2enmod rewrite ssl http2 headers

RUN ln -sf /dev/stdout /var/log/apache2/custom_access.log && ln -sf /dev/stderr /var/log/apache2/custom_error.log
WORKDIR /etc/apache2/sites-enabled

EXPOSE 80 443
CMD ["apache2ctl", "-D", "FOREGROUND"]
