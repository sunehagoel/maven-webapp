FROM centos

MAINTAINER rns@rnstech.com

RUN yum update -y
RUN yum -y install java
RUN java -version

RUN mkdir /opt/tomcat/

WORKDIR /opt
RUN curl -O https://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.50/bin/apache-tomcat-9.0.50.tar.gz
RUN tar xzvf apache-tomcat-8.5.42.tar.gz -C /opt/
RUN cp -R /opt/apache-tomcat-8.5.42/ /opt/tomcat

WORKDIR /opt/tomcat/webapps
COPY target/webapp.war .

EXPOSE 8080

ENTRYPOINT ["/opt/tomcat/bin/catalina.sh", "run"]
