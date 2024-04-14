# Build PHP backend
FROM php:8.1 AS backend

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

# Prepare MySQL container with user table creation script
FROM mysql:latest AS mysql

# Copy migration script into MySQL initialization directory
COPY database/migrations/create_users_table.sql /docker-entrypoint-initdb.d/

# Copy seed script into MySQL initialization directory
COPY database/seeds/seed_admin_user.sql /docker-entrypoint-initdb.d/

# Adjust permissions of the migration script to make it executable
RUN chmod +x /docker-entrypoint-initdb.d/create_users_table.sql

# Adjust permissions of the seed script to make it executable
RUN chmod +x /docker-entrypoint-initdb.d/seed_admin_user.sql

# Copy PHP backend files
FROM backend AS final

# Start PHP server
CMD ["php", "-S", "0.0.0.0:80", "-t", "public"]