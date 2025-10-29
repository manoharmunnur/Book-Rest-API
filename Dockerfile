# Step 1: Use an official JDK image to build the app
FROM maven:3.9.8-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Step 2: Use a lightweight JRE image to run the app
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

# Expose Render's dynamic port
EXPOSE 4432

# Command to run the Spring Boot app
ENTRYPOINT ["java","-jar","app.jar"]
