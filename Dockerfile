FROM ubuntu:14.04
MAINTAINER Huayuan Tu <tuhuayuan@gmail.com>
ENV UPDATED 2015-11-30

ADD http://mirrors.163.com/.help/sources.list.trusty /etc/apt/sources.list

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
RUN apt-get update &&  apt-get install -y pwgen mongodb-org mongodb-org-server mongodb-org-shell mongodb-org-mongos mongodb-org-tools 

RUN echo "mongodb-org hold" | dpkg --set-selections && \
    echo "mongodb-org-server hold" | dpkg --set-selections && \
    echo "mongodb-org-shell hold" | dpkg --set-selections && \
    echo "mongodb-org-mongos hold" | dpkg --set-selections && \
    echo "mongodb-org-tools hold" | dpkg --set-selections

VOLUME /data/db

ENV AUTH no
ENV STORAGE_ENGINE wiredTiger
ENV JOURNALING yes

ADD run.sh /run.sh
ADD set_mongodb_password.sh /set_mongodb_password.sh
EXPOSE 27017 28017

CMD ["/run.sh"]
