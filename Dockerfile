# Base image
FROM ubuntu:20.04

# Set maintainer
LABEL maintainer="your-email@example.com"

# Set non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive

# Update and install Apache
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

# Enable Apache service and set up default document root
RUN echo "Hello, Apache is running inside a Docker container!" > /var/www/html/index.html

# Expose the default HTTP port
EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]

