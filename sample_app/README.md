# README

## production mode

### 1. configure secret_key_base

```sh
$ ./bin/rails secrets:setup
$ RAILS_MASTER_KEY=`cat ./config/secrets.yml.key` EDITOR=vi ./bin/rails secrets:edit
# production:
#   secret_key_base: ....
# # you can generate the ... value with `./bin/rails secret`
$ rm -rf ./config/secrets.yml.key # save the key somewhere
```

### 2. build docker image with production mode

```sh
$ docker-compose build --build-arg RAILS_MASTER_KEY=...
```

### 3. start server

```sh
$ docker-compose up # logs of rails and nginx are redirected to docker log
```
