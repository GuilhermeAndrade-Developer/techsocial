FROM php:8.1

# Install basic package management tools
RUN apt-get update && apt-get install -y apt-utils

# Install additional dependencies
RUN apt-get update && apt-get install -y \
  git \
  unzip \
  libzip-dev \
  libpq-dev \
  && docker-php-ext-install pdo pdo_mysql pdo_pgsql zip

# Copy PHP configuration file
COPY php.ini /usr/local/etc/php/

# Set working directory
WORKDIR /var/www/html

# Copy backend files
COPY backend/ .

# Expose port 80 for web traffic
EXPOSE 80

# Start PHP server
CMD ["php", "-S", "0.0.0.0:80", "-t", "public"]
