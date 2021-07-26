# Springboot application demo script


1. Setup an environment as in [setup.md](setup.md) (needs some finetuning -- wip)
2. Copy your code (https://start.spring.io) or use the provided example [setup.md](setup.md#)
3. Edit your code
```
cd demo/src/main/java/com/example/demo/
```
Edit DemoApplication.java to reflect this example
```
package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class DemoApplication {

public static void main(String[] args) {
SpringApplication.run(DemoApplication.class, args);
}

@GetMapping("/hello")
public String hello(@RequestParam(value = "name", defaultValue = "World") String name) {
return String.format("Hello %s!", name);
}
}
```
Edit demo/src/main/resources/application.properties and add: 
```
server.address=0.0.0.0
```
3. Test your code (goto demo directory)
```
./mvnw spring-boot:run
```
You can now do something like from another terminal
```
curl http://127.0.0.1/hello?name=xxradar
```
4. Building a container image
```
./mvnw package && java -jar target/gs-spring-boot-docker-0.1.0.jar
```
Create a Dockerfile
```
FROM openjdk
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
```
Build the image ...
```
sudo docker build -t springio/gs-spring-boot-docker .
```
Test the image ...
```
sudo docker run -d -p 8080:8080 springio/gs-spring-boot-docker
```
```
curl http://127.0.0.1/hello
```
