FROM maven:3.8.5-openjdk-8 AS build

COPY src ./src

COPY pom.xml .

WORKDIR /app

RUN mvn clean package

FROM openjdk:8-jdk-alpine

COPY --from=build /usr/src/app/target/payments-service-example-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]