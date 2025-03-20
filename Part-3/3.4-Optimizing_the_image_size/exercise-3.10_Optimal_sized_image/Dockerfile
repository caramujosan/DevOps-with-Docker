# Make sure you have java 8 installed
FROM openjdk:8-jdk-alpine AS build

WORKDIR /usr/src/app 

# Install the spring boot app
COPY . .

RUN ./mvnw package

####

FROM openjdk:8-jre-alpine

WORKDIR /app

COPY --from=build /usr/src/app/target/docker-example-1.1.3.jar /app/target/

EXPOSE 8080

CMD ["java", "-jar", "./target/docker-example-1.1.3.jar"]
