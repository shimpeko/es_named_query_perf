# Reproducible set Elasticsearch Named Query Performance Degradation

This repo is a reproducible set for elasticsearch named query performance degredation after upgrading to 8.13.2 from 8.7.1.

## How to use

### Run query on ES 8.7.1

```bash
$ docker compose -f docker-compose-8-7.yaml up -d
$ ./commands.sh
```

### Run query on ES 8.13.2

```bash
$ docker compose -f docker-compose-8-13.yaml up -d
$ ./commands.sh
```

