# Using rpi image with java 8
FROM hypriot/rpi-java

# Build number hard-coded so far
COPY app.jar /data/

EXPOSE 80
CMD ["java", "-jar", "deployable-application.jar"]
