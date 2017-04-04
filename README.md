# gtfs-realtime-validator-docker
This is a docker file to set up the gtfs realtime validator. 

It takes the validator from https://github.com/CUTR-at-USF/gtfs-realtime-validator

# Build and run
```
git clone https://github.com/scrudden/gtfs-realtime-validator-docker.git
cd gtfs-realtime-validator-docker
docker built -t gtfs-validator .
docker run --name gtfs-validator-instance gtfs-validator 
```


