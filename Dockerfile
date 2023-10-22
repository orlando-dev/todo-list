FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install openjdk-17 -y

COPY . .

RUN apt-get install maven -y
RUN mvn clean install

FROM openjdk:177-jdk-slim

EXPOSE 8081

COPY --from=build /target/todolist-1.0.0.jar app.jar

ENTRYPOINT [ "java", "-jar", "app.jar" ]