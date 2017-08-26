## Configuration
Configurable build variables: DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME

## Examples

```
docker build --build-arg DATABASE_USER=root --build-arg DATABASE_PASSWORD=secret --build-arg DATABASE_NAME=application .
```

docker-compose

```
postgres:
    container_name: postgres
    build: 
        image: admarc/postgres
        args:
            - DATABASE_USER=development
            - DATABASE_NAME=development
```
