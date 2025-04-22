FROM maven:3.9.9-eclipse-temurin-8-focal AS builder

RUN mkdir -p /source/

COPY . /source

WORKDIR /source
ENV HOME=/source

RUN --mount=type=cache,target=/root/.m2 mvn clean package

# RUN --mount=type=bind,src=./caches/m2,dst=/root/.m2,rw mvn clean package

FROM tomcat:9.0.104-jdk21-corretto

COPY --from=builder /source/target/WebApp.war $CATALINA_HOME/webapps 
