FROM tomcat:latest

LABEL maintainer="Marc Negre"

COPY ./target/LoginWebApp.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]