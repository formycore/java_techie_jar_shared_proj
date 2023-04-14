FROM openjdk:8
EXPOSE 8080
ADD target/github_action_ex.jar github_action_ex.jar
ENTRYPOINT ["java", "-jar", "github_action_ex.jar"]
