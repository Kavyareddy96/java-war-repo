FROM maven:3.8.5-openjdk-17 AS builder 
WORKDIR /ops-app 
RUN git clone https://github.com/Kavyareddy96/java-war-repo.git . 
RUN mvn clean package 
FROM tomcat:10.1-jdk17 
WORKDIR /usr/local/tomcat/webapps/ 
EXPOSE 8080 
COPY --from=builder /ops-app/target/*.war opskill.war 
CMD ["catalina.sh", "run"] 
