FROM microsoft/dotnet:1.0.1-runtime

# install java
ADD http://mirrors.linuxeye.com/jdk/jdk-7u80-linux-x64.tar.gz /usr/local/  

ENV JAVA_HOME /usr/local/jdk1.7.0_80
ENV CLASSPATH ${JAVA_HOME}/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH $PATH:${JAVA_HOME}/bin

#install mycat
ADD http://dl.mycat.io/1.6-RELEASE/Mycat-server-1.6-RELEASE-20161028204710-linux.tar.gz /usr/local

#download mycat-ef-proxy
ADD https://github.com/PomeloFoundation/Entity-Framework-Core-MyCat-Proxy/releases/download/1.0.0-alpha2/MyCat-Entity-Framework-Core-Proxy.1.0.0-alpha2-netcore100.zip /usr/local/proxy
RUN cd /usr/local/proxy && sed -i -e 's#C:\\MyCat#/usr/local/mycat#g' config.json

VOLUME /usr/local/mycat/conf

EXPOSE 8066 9066
EXPOSE 7066

RUN nohup dotnet Pomelo.EntityFrameworkCore.MyCat.Proxy.dll

CMD ["/usr/local/mycat/bin/mycat", "console"]
