# Nutze ein leichtes Java-Image
FROM openjdk:17-jdk-alpine

# Arbeitsverzeichnis im Container
WORKDIR /app

# Baue das Projekt zuerst lokal mit: ./gradlew build
# Danach kopieren wir das erstellte JAR in das Docker-Image
COPY build/libs/*.jar app.jar

# Starte das JAR
ENTRYPOINT ["java", "-jar", "app.jar"]
