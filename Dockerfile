# Step 1: Use Maven image to build the app
FROM maven:3.9.6-eclipse-temurin-17 AS build

# Set working directory inside container
WORKDIR /app

# Copy pom.xml and download dependencies (layer caching)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy project files and build the jar
COPY . .
RUN mvn clean package -DskipTests

# Step 2: Use a smaller runtime image for final container
FROM eclipse-temurin:17-jdk-jammy

# Set working directory for runtime
WORKDIR /app

# Copy the jar from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose port 8080
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]
