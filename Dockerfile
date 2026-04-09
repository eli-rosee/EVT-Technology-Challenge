FROM nginx:stable

COPY resources/index.html /usr/share/nginx/html/

COPY configs/nginx.conf /etc/nginx/nginx.conf

RUN mkdir /etc/nginx/certs
COPY certs/server.key /etc/nginx/certs/server.key
COPY certs/server.crt /etc/nginx/certs/server.crt

EXPOSE 443 80

CMD ["nginx", "-g", "daemon off;"]
