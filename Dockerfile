# Use a base image with PHP and Apache
FROM php:7.4-apache

# Install any necessary dependencies
RUN apt-get update \
    && apt-get install -y apache2 \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy the necessary files and directories to the container
COPY index.html /var/www/html
COPY careers.html /var/www/html
COPY contactme.php /var/www/html
COPY composer.lock /var/www/html
COPY careers.php /var/www/html
COPY composer.json /var/www/html
COPY css/ /var/www/html/css/
COPY images/ /var/www/html/images/
COPY js/ /var/www/html/js/
COPY mailing/ /var/www/html/mailing/
COPY lib/ /var/www/html/lib/
COPY vendor/ /var/www/html/vendor/

# Install any necessary dependencies
RUN apt-get update \
    && apt-get install -y libpng-dev \
    && docker-php-ext-install mysqli pdo pdo_mysql gd

# Expose the container's port (assuming your application runs on port 80)
EXPOSE 80

# Start the Apache server
CMD ["apache2-foreground"]
