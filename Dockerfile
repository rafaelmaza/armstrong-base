FROM debian:jessie

# Updating system
RUN apt-get update -y

# Installing Apache 2.4
RUN apt-get install -y apache2

# Adding apache ServerName
RUN echo "" >> /etc/apache2/apache2.conf && \
	echo "# ServerName" >> /etc/apache2/apache2.conf && \
	echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Adding Dotdeb repository so we may install PHP 7
RUN apt-get install -y wget curl zip unzip git && \
	echo "deb http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list && \
	echo "deb-src http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list && \
	cd /tmp && \
	wget https://www.dotdeb.org/dotdeb.gpg && \
	apt-key add dotdeb.gpg && \
	rm dotdeb.gpg && \
	apt-get update -y

# Installing PHP as well as some extensions
RUN apt-get install -y php7.0 php7.0-cli php7.0-common php7.0-dom php7.0-mysql php7.0-xdebug php7.0-mcrypt php7.0-mbstring php7.0-zip php7.0-bcmath php7.0-ssh2 libapache2-mod-php7.0

# Enabling apache mod Rewrite
RUN a2enmod rewrite

#Running in background
CMD apachectl -DFOREGROUND
