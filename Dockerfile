FROM openjdk:8-jdk-alpine
COPY java-artifact.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]