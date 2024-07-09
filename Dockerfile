FROM openjdk:8-jdk-alpine AS build
COPY --from=build target/payments-service-example-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]