FROM hypriot/rpi-java
COPY deployable-application.jar /data/
EXPOSE 9001
CMD ["java", "-jar", "deployable-application.jar"]
