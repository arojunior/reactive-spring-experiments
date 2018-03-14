# Build Reactive Rest APIs with Spring WebFlux and Reactive MongoDB

## Requirements

1. Java - 1.8.x

2. Maven - 3.x.x

3. MongoDB - 3.x.x

OR

1. Docker

## Steps to Setup (without docker)

```bash
docker-compose up -d
```

That's it!

## Steps to Setup (without docker)

Note: without docker you should run MongoDB locally

**1. Clone the application**

```bash
git clone https://github.com/arojunior/reactive-spring-experiments.git
```

**2. Build and run the app using maven**

```bash
cd reactive-spring-experiments
mvn package
java -jar target/demo-0.0.1-SNAPSHOT.jar
```

Alternatively, you can run the app without packaging it using -

```bash
mvn spring-boot:run
```

## Exploring the Rest APIs

The server will start at <http://localhost:8080>.

The application defines following REST APIs

```
1. GET /tweets - Get All Tweets

2. POST /tweets - Create a new Tweet

3. GET /tweets/{id} - Retrieve a Tweet by Id

3. PUT /tweets/{id} - Update a Tweet

4. DELETE /tweets/{id} - Delete a Tweet

4. GET /stream/tweets - Stream tweets to a browser as Server-Sent Events
```

## Running integration tests

The project also contains integration tests for all the Rest APIs. For running the integration tests, go to the root directory of the project and type `mvn test` in your terminal.
