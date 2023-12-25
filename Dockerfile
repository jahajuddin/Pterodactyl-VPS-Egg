FROM ubuntu:latest

RUN apt update && apt install -y openssh-server sudo nginx

RUN mkdir /var/run/sshd
RUN echo 'root:manush' | chpasswd

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test

RUN wget https://localtonet.com/download/localtonet-linux-x64.zip && \
    unzip localtonet-linux-x64.zip && \
    chmod 777 ./localtonet && \
    ./localtonet authtoken OyuCiHePFb7DtxGkVNfwal6goR23A4JqX &

EXPOSE 22 8080

CMD ["/usr/sbin/sshd", "-D"]
CMD ["nginx", "-g", "daemon off;"]
