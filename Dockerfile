# Verwende ein Java-Image mit Gradle
FROM gradle:8.4.0-jdk17 AS build

# Kopiere Projektdateien
COPY --chown=gradle:gradle . /home/gradle/project
WORKDIR /home/gradle/project

# Baue das Projekt
RUN gradle build --no-daemon

# Neues schlankes Image für den Run
FROM openjdk:17-jdk-alpine

WORKDIR /app

# Kopiere die gebaute .jar-Datei aus dem vorherigen Schritt
COPY --from=build /home/gradle/project/build/libs/*.jar app.jar

# Starte das Backend
ENTRYPOINT ["java", "-jar", "app.jar"]

