# build
FROM openjdk:11.0.8-jdk-slim as 
WORKDIR /app
COPY ./target/*jar /app.jar
CMD ["java", "-jar", "app.jar"]


