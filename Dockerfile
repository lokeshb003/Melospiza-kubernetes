FROM ubuntu:22.10 

WORKDIR /home/lokesh/melospiza/Melospiza

RUN mkdir /root/melospiza
COPY * /root/melospiza/

RUN apt update && apt install nginx -y

WORKDIR /root/melospiza
COPY * /var/www/html/

RUN rm /var/www/html/index.nginx-debian.html
RUN apt install systemctl -y
RUN systemctl enable nginx && systemctl start nginx 
EXPOSE 80

ENTRYPOINT ['/bin/bash','-c']
