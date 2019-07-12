FROM maven:3.3-jdk-8 AS build
MAINTAINER Sean Óg Crudden <og.crudden@gmail.com>

# Install git 
RUN apt-get install -y git

# Change to correct directory
WORKDIR /root/gtfs-realtime-validator/

# Clone validator
RUN git clone https://github.com/CUTR-at-USF/gtfs-realtime-validator.git .

# Build
RUN mvn package

# Create new image
FROM openjdk:8-jre-slim

WORKDIR /root/gtfs-realtime-validator
# Copy jar from build stage
COPY --from=build /root/gtfs-realtime-validator/gtfs-realtime-validator-webapp/target/gtfs-realtime-validator-webapp-1.0.0-SNAPSHOT.jar ./gtfs-realtime-validator.jar
# Expose port
EXPOSE 8080
# Set entrypoint
ENTRYPOINT ["java", "-jar", "gtfs-realtime-validator.jar"]
