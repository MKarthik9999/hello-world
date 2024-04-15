#stage-1 build
FROM karthikmms2000/my_customimages:jdk17-maven-tomcat as build
WORKDIR /app
COPY . /app
RUN mvn clean package


#stage-2 deploy to tomcat
#FROM karthikmms2000/my_customimages:jdk17-maven-tomcat as deploy
FROM build as deploy
COPY --from=build /app/target/spring3-mvc-maven-xml-hello-world-1.0-SNAPSHOT.war /opt/tomcat/webapps/
EXPOSE 8080
CMD starttomcat
