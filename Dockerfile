# Use a multi-stage build to combine stages
FROM karthikmms2000/jdk17-maven-and-tomcat9:latest as build

# Set the working directory
WORKDIR /app

# Copy the application source code
COPY . /app

# Build the application artifact
RUN mvn clean package


# Deploy the application artifact to Tomcat
FROM tomcat:9.0

# Set the Tomcat environment variables
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# Copy the application artifact from the build stage
COPY --from=build /app/target/spring3-mvc-maven-xml-hello-world-1.0-SNAPSHOT.war $CATALINA_HOME/webapps/

# Expose the Tomcat port
EXPOSE 8080

# Set the entrypoint to start Tomcat
ENTRYPOINT ["catalina.sh", "run"]

