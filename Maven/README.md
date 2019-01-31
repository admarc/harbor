# Maven docker image
## Usage
```
docker run -it --rm -v "$(pwd)":/usr/src/maven -v /path_to_local_repository:/root/.m2/repository -w /usr/src/maven admarc/maven:alpine mvn clean install
```

Change `path_to_local_repository` to the path where you wish to have your maven local repository stored.

If there is a need for maven to connect to docker daemon (for example required by spotify maven plugin) additional volume is needed: `-v /var/run/docker.sock:/var/run/docker.sock`

For convenience you can create file called `mvn` make it executable and move it to `/usr/bin` with:
```
#!/bin/bash
docker run -it --rm -v "$(pwd)":/usr/src/maven -v /path_to_local_repository:/root/.m2/repository -w /usr/src/maven admarc/maven:alpine mvn $1 $2 $3 $4 $5
```

This way you will be able to use it locally: `mvn clean install`.
