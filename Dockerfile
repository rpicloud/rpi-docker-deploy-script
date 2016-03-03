FROM java
COPY app.jar /data/
EXPOSE 1234
CMD ["java", "-jar", "deployable-application.jar"]
