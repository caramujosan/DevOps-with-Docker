# Make sure you have java 8 installed
FROM openjdk:8-jdk-alpine

EXPOSE 8080

WORKDIR /usr/src/app

# Install the spring boot app
COPY . .

RUN ./mvnw package

CMD ["java", "-jar", "./target/docker-example-1.1.3.jar"]
#
