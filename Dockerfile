FROM openjdk:8-jdk-alpine
COPY java-artifact.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]