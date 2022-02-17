FROM openjdk:11.0.1-jre-slim-stretch
EXPOSE 8080

COPY target/*jar /app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
