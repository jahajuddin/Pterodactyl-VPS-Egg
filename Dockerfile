FROM ubuntu:latest
RUN apt update
RUN apt install  openssh-server sudo -y
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test 
RUN usermod -aG sudo test
RUN service ssh start
RUN apt-get install -y nginx
RUN echo "server { listen 8080; server_name localhost; location / { return 200 'Hello, World!'; } }" > /etc/nginx/sites-available/default
RUN echo 'root:manush' | chpasswd
EXPOSE 22 8080
CMD nginx -g 'daemon off;'
RUN ["/usr/sbin/sshd","-D"]
RUN wget https://localtonet.com/download/localtonet-linux-x64.zip && unzip localtonet-linux-x64.zip && chmod 777 ./localtonet && ./localtonet authtoken OyuCiHePFb7DtxGkVNfwal6goR23A4JqX
