# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "janagarajs@gmail.com" 
USER jenkins
EXPOSE 8081
COPY ./webapp/target/webapp.war /usr/local/tomcat/webapps

