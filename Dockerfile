FROM maven:3.3-jdk-8
MAINTAINER Sean Óg Crudden <og.crudden@gmail.com>

RUN apt-get update

# Install git 
RUN apt-get install -y git

# Clone validator
RUN git clone https://github.com/CUTR-at-USF/gtfs-realtime-validator.git /root/gtfs-realtime-validator/

# Change to correct directory
WORKDIR /root/gtfs-realtime-validator/

# Build
RUN mvn package

# Run
CMD java -jar target/gtfs-rt-validator-1.0.0-SNAPSHOT.jar

#Expose port
EXPOSE 8080
