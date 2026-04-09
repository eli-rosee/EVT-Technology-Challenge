FROM nginx:stable

WORKDIR /usr/share/nginx/html
COPY resources/index.html ./

WORKDIR /etc/nginx/
RUN rm nginx.conf
COPY configs/nginx.conf ./

RUN mkdir certs
COPY certs/server.key  ./certs/
COPY certs/server.crt ./certs/

EXPOSE 443 80

CMD ["nginx", "-g", "daemon off;"]
