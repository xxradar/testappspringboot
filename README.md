# testappspringboot


!. Setup an envirnment via setup.sh (needs some finetuning -- wip)
2. Deploy your code
```
cd demo/src/main/java/com/example/demo/
```
Edit DemoApplication.java
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
