# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "janagarajs@gmail.com" 
USER jenkins
COPY ./webapp.war /usr/local/tomcat/webapps

