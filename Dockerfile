#stage-1 build
FROM karthikmms2000/jdk17-maven-and-tomcat9:latest as build
WORKDIR /app
COPY . /app
RUN mvn clean package


#stage-2 deploy to tomcat
FROM build as deploy
COPY --from=build /app/target/spring3-mvc-maven-xml-hello-world-1.0-SNAPSHOT.war /opt/tomcat/webapps/
EXPOSE 8080
ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
ENTRYPOINT ["catalina.sh","run"]
 
