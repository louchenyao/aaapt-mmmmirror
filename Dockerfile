FROM ubuntu:16.04

RUN echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse\n\
    deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse\n\
    deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiversen\n\
    deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse\n" > /etc/apt/sources.list

RUN apt-get update && apt-get install -y apt-mirror nginx

COPY mirror.list /etc/apt/mirror.list
COPY run.sh /bin
COPY default.conf /etc/nginx/sites-enabled/default

CMD ["bash", "/bin/run.sh"]