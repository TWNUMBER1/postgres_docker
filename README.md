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

### pgadmin server

```sh
sudo apt-get install virtualenv python-pip libpq-dev python-dev
mkdir pgadmin4
virtualenv pgadmin4
cd pgadmin4
source bin/activate
pip install https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v1.6/pip/pgadmin4-1.6-py2.py3-none-any.whl
vim local/lib/python2.7/site-packages/pgadmin4/config.py  // change the DEFAULT_SERVER = '0.0.0.0:5050' instead of 'localhost:5050'
python lib/python2.7/site-packages/pgadmin4/pgAdmin4.py
```
*
