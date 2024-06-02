FROM php:7.4-apache

# Install MySQLi extension
RUN docker-php-ext-install mysqli

# Copy application source code to the container
COPY . /var/www/html/

# Ensure the permissions are correct for the Apache web server
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Copy the custom PHP configuration file
COPY config.php /var/www/html/config.php

EXPOSE 80

# Start the Apache service
CMD ["apache2-foreground"]
