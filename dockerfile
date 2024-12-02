FROM maven:3.8.5-openjdk-17 AS build-stage
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

#second stage
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build-stage /app/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]