FROM openjdk:8-jdk-alpine
COPY target/payments-service-example.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]