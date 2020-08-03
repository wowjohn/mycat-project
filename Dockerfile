FROM centos
MAINTAINER jimu<1055441929@qq.com>

LABEL name="Java1234 myCat Image" \
    build-date="20200722"

ADD server-jre-8u151-linux-x64.tar.gz /home/
ADD Mycat-server-1.6.7.5-release-20200422133810-linux.tar.gz /home/

ENV WORKPATH /home/mycat/
WORKDIR $WORKPATH

ENV JAVA_HOME /home/jdk1.8.0_151
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/lib:$CATALINA_HOME/bin

EXPOSE 8066

RUN mkdir -p /home/mycat/logs/ \
    && touch /home/mycat/logs/mycat.pid

CMD /home/mycat/bin/mycat console