FROM ubuntu:latest
RUN apt-get update \
    && apt-get install -y openssh-server \
    && mkdir /var/run/sshd
RUN echo 'root:Water1337//' | chpasswd
EXPOSE 8080
CMD ["/usr/sbin/sshd", "-D"]
