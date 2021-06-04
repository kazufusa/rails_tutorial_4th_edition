# README

## how to configure secret_key_base

```sh
$ ./bin/rails secrets:setup
$ EDITOR=vi ./bin/rails secrets:edit
$ RAILS_MASTER_KEY=`cat ./config/secrets.yml.key` EDITOR=vi ./bin/rails secrets:edit
# add secret_key_base: XXX....
# you can generate the XXX... value with `./bin/rails secret`
$ rm -rf ./config/secrets.yml.key # save the key somewhere
```

## build docker image with production mode

```sh
$ docker-compose build --progress=plain --build-arg RAILS_MASTER_KEY=XXX...
```
