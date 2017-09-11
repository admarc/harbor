## Configuration
Configurable environment variables: DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME (to configure database and user all of variables needs to be provided)

## Examples

```
docker run --env DATABASE_USER=root --env DATABASE_PASSWORD=secret --env DATABASE_NAME=application .
```

docker-compose

```
postgres:
    container_name: postgres
    build: 
        image: admarc/postgres
        environment:
            - DATABASE_USER=development
            - DATABASE_PASSWORD=development
            - DATABASE_NAME=development
```
