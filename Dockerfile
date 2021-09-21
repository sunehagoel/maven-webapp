FROM centos

MAINTAINER rns@rnstech.com

#RUN yum update -y
RUN yum -y install java
RUN java -version
RUN yum install wget -y

#RUN mkdir /opt/tomcat/

WORKDIR /opt
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.53/bin/apache-tomcat-9.0.53-windows-x64.zip
RUN tar xzvf apache-tomcat-9.0.53.tar.gz -C /opt/
RUN cp -R /opt/apache-tomcat-9.0.53/ /opt/tomcat

WORKDIR /opt/tomcat/webapps
COPY target/webapp.war .

EXPOSE 8080

ENTRYPOINT ["/opt/tomcat/bin/catalina.sh", "run"]
