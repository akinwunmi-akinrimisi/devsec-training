FROM php:8.2-apache

# Install required dependencies
RUN apt-get update && apt-get install -y \
    git mariadb-client libpng-dev libjpeg-dev libonig-dev libxml2-dev \
    zip unzip curl wget gnupg && \
    docker-php-ext-install mysqli pdo pdo_mysql gd && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Clone DVWA from GitHub (latest main version)
RUN git clone https://github.com/digininja/DVWA.git /var/www/html

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Expose web port
EXPOSE 80

# Health check
HEALTHCHECK CMD curl --fail http://localhost || exit 1
