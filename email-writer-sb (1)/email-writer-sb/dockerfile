# Stage 1: build the application using Maven
FROM maven:3.10.1-openjdk-17-slim AS build
WORKDIR /app
COPY pom.xml mvnw* ./
COPY .mvn .mvn
COPY src src
RUN mvn clean package -DskipTests

# Stage 2: run the jar
FROM openjdk:17-jdk-slim
WORKDIR /app
ARG JAR_FILE=target/*.jar
COPY --from=build /app/${JAR_FILE} app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
