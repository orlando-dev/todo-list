FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install openjdk-17-jdk maven -y

WORKDIR /app

COPY . .

RUN mvn clean install

FROM openjdk:17-jdk-slim

EXPOSE 8081

WORKDIR /app

COPY --from=build /app/target/todolist-1.0.0.jar app.jar

CMD ["java", "-jar", "app.jar"]
