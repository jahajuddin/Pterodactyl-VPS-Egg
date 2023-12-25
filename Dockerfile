FROM ubuntu:latest
RUN apt-get update \
    && apt-get install -y openssh-server \
    && mkdir /var/run/sshd
RUN echo 'root:manush' | chpasswd
EXPOSE 22 8080
RUN apt-get install -y nginx
RUN echo "server { listen 8080; server_name localhost; location / { return 200 'Hello, World!'; } }" > /etc/nginx/sites-available/default
RUN wget https://localtonet.com/download/localtonet-linux-x64.zip
RUN unzip localtonet-linux-x64.zip
RUN chmod 777 ./localtonet
RUN ./localtonet authtoken OyuCiHePFb7DtxGkVNfwal6goR23A4JqX
CMD ["sh", "-c", "ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -R toxicpani1:22:localhost:22 serveo.net"]
CMD service ssh start && nginx -g 'daemon off;'
