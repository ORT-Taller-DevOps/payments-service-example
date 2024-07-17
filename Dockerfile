FROM maven:3.8.4-openjdk-11 AS package
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn package -DskipTests

FROM openjdk:8-jdk-alpine
WORKDIR /app
COPY --from=package /app/target/payments-service-example-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","-Xmx256m","/app.jar"]