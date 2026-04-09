# Base image with nginx pre-installed (pulled from Docker Hub)
FROM nginx:stable

# Copy webpage to container
COPY resources/index.html /usr/share/nginx/html/

# Copy nginx config to container
COPY configs/nginx.conf /etc/nginx/nginx.conf

# Set up private key / cert pair in container
RUN mkdir /etc/nginx/certs
COPY certs/server.key /etc/nginx/certs/server.key
COPY certs/server.crt /etc/nginx/certs/server.crt

# Expose HTTP and HTTPS Ports in the container
EXPOSE 80 443

# Run nginx command upon container run
CMD ["nginx", "-g", "daemon off;"]
