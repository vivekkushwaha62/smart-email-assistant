# Stage 1: Build the application
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# Copy module folder
COPY "email-writer-sb (1)/pom.xml" /app/
COPY "email-writer-sb (1)/src" /app/src

RUN mvn clean package -DskipTests

# Stage 2: Run the JAR
FROM eclipse-temurin:17-jdk
WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
