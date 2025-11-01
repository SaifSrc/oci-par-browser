# syntax=docker/dockerfile:1
FROM nginx:1.27-alpine

# Remove default static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy application
COPY index.html /usr/share/nginx/html/index.html

# Expose port
EXPOSE 80

# Use default nginx start command
