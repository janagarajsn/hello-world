# Pull base image 
FROM tomcat 

# Maintainer 
MAINTAINER "janagarajs@gmail.com" 
USER 113
EXPOSE 8081
COPY ./webapp/target/webapp.war /usr/local/tomcat/webapps

