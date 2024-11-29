FROM amazoncorretto:17

WORKDIR /src

COPY --from=build src/target/*.jar ./app.jar

CMD java -jar  app.jar
