FROM ubuntu:22.10 

WORKDIR /root
RUN apt update && apt install git -y
RUN mkdir /root/melo
WORKDIR /root/melo
RUN git clone https://github.com/MelospizaStartUp/Melospiza
WORKDIR /root/melo/Melospiza
RUN apt install nginx -y

COPY /root/melo/Melospiza/* /var/www/html/

RUN rm /var/www/html/index.nginx-debian.html
RUN apt install systemctl -y
RUN systemctl enable nginx 
EXPOSE 80

CMD ["nginx","-g","daemon off;"]
