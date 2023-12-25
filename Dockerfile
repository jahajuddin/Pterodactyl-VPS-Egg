FROM ubuntu:latest
RUN apt-get update \
    && apt-get install -y openssh-server \
    && mkdir /var/run/sshd
RUN echo 'root:manush' | chpasswd
EXPOSE 22 8080
RUN apt-get install -y nginx
RUN echo "server { listen 8080; server_name localhost; location / { return 200 'Hello, World!'; } }" > /etc/nginx/sites-available/default
RUN ssh -R 80:localhost:22 serveo.net && yes
CMD service ssh start && nginx -g 'daemon off;'
