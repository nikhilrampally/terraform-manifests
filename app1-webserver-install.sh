#!/bin/bash

# Install necessary packages
sudo apt update
sudo apt install -y ngnix
sudo apt install -y telnet nginx

# Enable and start nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Set permissions and create directory
sudo chmod -R 755 /var/www/html
sudo mkdir -p /var/www/html/app1

# Variables
HOSTNAME=$(hostname)
IP=$(hostname -I | awk '{print $1}')

# HTML content
HTML_CONTENT="<!DOCTYPE html>
<html>
<head>
  <title>StackSimplify - WebVM App1</title>
  <style>
    body {
      background-color: #f8eaea;
      font-family: Arial, sans-serif;
      padding: 40px;
      color: #333;
    }
    .container {
      background: white;
      padding: 20px 40px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      max-width: 800px;
      margin: auto;
      text-align: center;
    }
    h1 {
      color: #d9534f;
    }
    p {
      font-size: 1.2em;
    }
  </style>
</head>
<body>
  <div class='container'>
    <h1>Welcome to StackSimplify - WebVM App1</h1>
    <p><strong>VM Hostname:</strong> $HOSTNAME</p>
    <p><strong>VM IP Address:</strong> $IP</p>
    <p><strong>Application Version:</strong> V1</p>
    <p>Google Cloud Platform - Demos</p>
  </div>
</body>
</html>"

# Write to index.html in both locations
echo "$HTML_CONTENT" | sudo tee /var/www/html/index.html > /dev/null
echo "$HTML_CONTENT" | sudo tee /var/www/html/app1/index.html > /dev/null
