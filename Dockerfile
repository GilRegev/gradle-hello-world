# Stage 1 - Build
FROM gradle:7.4.2-jdk11 AS builder
WORKDIR /app
COPY . .
RUN gradle build

# Stage 2 - Run
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=builder /app/build/libs/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
