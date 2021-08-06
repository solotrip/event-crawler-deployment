# Event Crawlers

- `.env` file should contain these variables
```
MONGO_URL=
MAPBOX_API_KEY=
MONGO_DB_NAME=solotrip
```

## Everfest

```
docker run --env-file .env ghcr.io/solotrip/event-crawler:latest bash /app/scripts/everfest.sh
```

## Festicket

```
docker run --env-file .env ghcr.io/solotrip/event-crawler:latest bash /app/scripts/festicket.sh
```

## Radseason

```
docker run --env-file .env ghcr.io/solotrip/event-crawler:latest bash /app/scripts/radseason.sh
```

----

## Publishing Docker Image to Github Container Registry

```
bash build.sh
docker push ghcr.io/solotrip/event-crawler:latest
```
