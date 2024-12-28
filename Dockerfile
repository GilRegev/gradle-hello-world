# Stage 1 - Build
FROM gradle:7.4.2-jdk11 AS builder
WORKDIR /app
COPY . .
RUN gradle build

# Stage 2 - Run
FROM openjdk:11-jre-slim

# Create a non-root user
RUN addgroup --system appgroup && adduser --system appuser --ingroup appgroup

# Set permissions for the app directory
WORKDIR /app
COPY --from=builder /app/build/libs/*.jar app.jar

# Switch to non-root user
USER appuser

# Command to run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
