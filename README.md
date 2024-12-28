# CI/CD Pipeline for Java App with Docker

## Overview
This project demonstrates a CI/CD pipeline for building and deploying a Java application using Gradle and Docker.

## Features
- Automatic version incrementing (Patch).
- Builds and uploads artifacts.
- Creates Docker images tagged with versions.
- Pushes images to Docker Hub.
- Ensures Docker images run as a **non-root user** for security.

## Usage
### Pull and Run the Docker Image
```bash
docker pull gilr7/my-app:latest
docker run -d --name test-container gilr7/my-app:latest
docker exec -it test-container whoami
