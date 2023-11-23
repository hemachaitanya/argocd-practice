FROM caddy
RUN cd /var/www/html && rm index.html
COPY dog.jpg /var/www/html/dog.jpg

