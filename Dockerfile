FROM ubuntu:latest
RUN apt-get update \
    && apt-get install -y wget unzip \
    && apt-get install -y openssh-server \
    && mkdir /var/run/sshd
RUN echo 'root:manush' | chpasswd
EXPOSE 22 8080
RUN apt-get install -y nginx
RUN echo "server { listen 8080; server_name localhost; location / { return 200 'Hello, World!'; } }" > /etc/nginx/sites-available/default
CMD wget https://localtonet.com/download/localtonet-linux-x64.zip && unzip localtonet-linux-x64.zip && chmod 777 ./localtonet
RUN service ssh start && nginx -g 'daemon off;' && ./localtonet authtoken OyuCiHePFb7DtxGkVNfwal6goR23A4JqX
