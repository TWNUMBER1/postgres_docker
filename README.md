# postgres_docker


### To build docker to generate image
```sh
make build [TAG=<image version>] 
```

### To run docker with specified command
```sh
make run [TAG=<image version>] [CMD=<command>] #/bin/bash, or default if not specify it
```

### To push to docker io
```sh
make login # To log into docker io first
make push [TAG=<image version>]
```

### To clean containers and images
```sh
make stop #To stop container
make rmc #To remove container
make rmi #To remove image
make clean  #Remove conatiner and images together
```
