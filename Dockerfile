FROM maven:3.3-jdk-8
MAINTAINER Sean Óg Crudden <og.crudden@gmail.com>
RUN apt-get update

# Install vi
RUN apt-get install -y vim

# Install git 
RUN apt-get install -y git

RUN git clone https://github.com/CUTR-at-USF/gtfs-realtime-validator.git /root/gtfs-realtime-validator/

WORKDIR /root/gtfs-realtime-validator/

RUN mvn package

CMD java -jar target/gtfs-rt-validator-1.0-SNAPSHOT.jar

EXPOSE 8080