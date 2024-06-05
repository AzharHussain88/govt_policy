# Use the official Drupal image as a base
FROM drupal:9.5.11

# Set the working directory
WORKDIR /var/www/html

# Copy the current directory contents into the container
COPY . .

# Install additional dependencies if needed
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

# Expose port 80
EXPOSE 80

# Start the web server
CMD ["apache2-foreground"]
