FROM caddy
RUN apt install systemctl -y
RUN systemctl stop caddy && cd /var/www/html && rm index.html
COPY dog.jpg /var/www/html/dog.jpg
RUN systemctl start caddy
