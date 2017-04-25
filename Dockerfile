FROM debian:jessie

# Updating system
RUN apt-get update -y

# Installing basic binnaries
RUN apt-get install -y wget curl zip unzip git

# Installing Apache 2.4
RUN apt-get install -y apache2

# Adding apache ServerName
RUN echo "" >> /etc/apache2/apache2.conf && \
	echo "# ServerName" >> /etc/apache2/apache2.conf && \
	echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Adding PHP 7.1 repository
RUN apt-get install -y apt-transport-https lsb-release ca-certificates && \
	wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
	echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list && \
	apt-get update

# Installing PHP as well as some extensions
RUN apt-get install -y php7.1 php7.1-cli php7.1-common php7.1-dom php7.1-mysql php7.1-xdebug php7.1-mcrypt php7.1-mbstring php7.1-zip php7.1-bcmath libapache2-mod-php7.1

# Enabling apache mod Rewrite
RUN a2enmod rewrite

#Running in background
CMD apachectl -DFOREGROUND