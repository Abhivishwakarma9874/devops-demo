FROM php:8.3-fpm

WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y \
    git curl zip unzip libpng-dev libonig-dev libxml2-dev nginx supervisor \
    && docker-php-ext-install pdo pdo_mysql pdo_sqlite mbstring exif pcntl bcmath gd

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy project files
COPY . .

# Install Laravel dependencies
RUN composer install --no-dev --optimize-autoloader

# Fix permissions
RUN chown -R www-data:www-data storage bootstrap/cache database
RUN chmod -R 777 storage bootstrap/cache database

# Copy Nginx config
COPY ./nginx/default.conf /etc/nginx/sites-available/default

# Expose Railway port
EXPOSE $PORT

# Start Nginx + PHP-FPM
CMD service nginx start && php-fpm