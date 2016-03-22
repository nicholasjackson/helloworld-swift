# helloworld-swift
Hello World Swift is an example microservice using the IBM Kitura framework [https://github.com/IBM-Swift/Kitura.git](https://github.com/IBM-Swift/Kitura.git).  The code is built and tested using an experimental version of the Minke gem so all you need is the docker toolbox for your Mac.  

Currently there are no XCTests and even if there were Minke can not run the test suite, this is currently work in progress.  

[![Circle CI](https://circleci.com/gh/nicholasjackson/helloworld-swift.svg?style=svg)](https://circleci.com/gh/nicholasjackson/helloworld-swift)  


## Build instructions
Change to the build directory.  
```
$ cd _build
```  

Install the gem dependencies.
```
$ bundle
```

Build the server application code run the tests and wrap everything up in some docker goodness.
```
$ bundle exec rake app:build_server
```

Run the application, this will use Docker Compose to start the server and the dependencies like Consul and Elasticsearch.
```
$ bundle exec rake app:run
```
Then open your web browser at: [http://192.168.99.100:8900/v1/health](http://192.168.99.100:8900/v1/health) assuming 192.168.99.100 is the ip address of your docker vm.  

Run the functional tests (not implemented, yet).
```
$ bundle exec rake app:cucumber
```


## Manual Building
Kitura requires swift 3 so unless you can be bothered to install that I recommend running all the builds inside of a docker container.  To do that you can start the container like so...
```
$ docker run --rm -i -t -p 8090:8090 -v $(pwd):/src -w /src ibmcom/kitura-ubuntu:latest /bin/bash
```

Then to run the build...
```
$ swift build -Xcc -fblocks
```

Run the application
```
$ .build/debug/SuggestedSearch
```


## Useful stuff
### Start Docker VM
```
$ docker-machine start default
```

### Stop Docker VM
```
$ docker-machine stop default
```

### Set Docker environment
```
$ eval $(docker-machine env default)
```

### Software
Docker Toolbox [https://www.docker.com/products/docker-toolbox](https://www.docker.com/products/docker-toolbox)  
RVM [https://rvm.io/](https://rvm.io/)  
