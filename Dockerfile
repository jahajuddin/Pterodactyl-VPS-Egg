FROM ubuntu:latest
RUN apt-get update \
    && apt-get install -y openssh-server \
    && mkdir /var/run/sshd

RUN echo 'root:manush' | chpasswd

RUN apt-get install -y nginx

EXPOSE 22 8080

CMD ssh -R 80:localhost:22 serveo.net

CMD service ssh start && nginx -g 'daemon off;'
