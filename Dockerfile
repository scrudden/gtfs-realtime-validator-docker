FROM java:8

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

