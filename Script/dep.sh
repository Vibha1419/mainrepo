#!/bin/bash

echo "===== BeforeInstall: Starting ====="

# Update yum
yum update -y

# Install Apache (httpd) if not already installed
if ! command -v httpd &> /dev/null
then
    echo "Apache not found. Installing httpd..."
    yum install -y httpd
else
    echo "Apache already installed."
fi

# Stop Apache to avoid conflicts during deployment
echo "Stopping httpd service..."
systemctl stop httpd

# Backup or remove existing web content
if [ -d "/var/www/html" ]; then
    echo "Cleaning up existing content in /var/www/html"
    rm -rf /var/www/html/*
fi

echo "===== BeforeInstall: Complete ====="
