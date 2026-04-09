FROM nginx:stable

WORKDIR /usr/share/nginx/html
COPY resources/index.html ./

WORKDIR /etc/nginx/
RUN rm nginx.conf
COPY configs/nginx.conf ./

EXPOSE 443

RUN service nginx start
