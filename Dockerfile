FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install openjdk-17-jdk maven -y

COPY . .

RUN mvn clean install

FROM openjdk:17-jdk-slim

EXPOSE 8081

COPY --from=build /target/todolist-1.0.0.jar app.jar

CMD ["java", "-jar", "app.jar"]
