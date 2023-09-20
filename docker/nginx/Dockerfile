FROM nginx:1.25.2
RUN rm -rf /etc/nginx/conf.d/default.conf
ADD index.html /var/www/html/index.html
ADD nginx.conf /etc/nginx/conf.d/nginx.conf