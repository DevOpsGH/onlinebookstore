FROM maven:3.6-jdk-11 as mvn
RUN git clone https://github.com/DevOpsGH/onlinebookstore.git
RUN cd onlinebookstore && mvn package

FROM openjdk:8-alpine
LABEL AUTHOR="DevOpsThink"
COPY --from=mvn /onlinebookstore/target/onlinebookstore*.jar /onlinebookstore.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar"]
CMD ["/onlinebookstore.jar"]
