
FROM amazoncorretto:17

WORKDIR /src

COPY  src/target/*.jar ./app.jar

CMD java -jar  app.jar
