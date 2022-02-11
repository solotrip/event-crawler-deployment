# Event Crawlers

- `.env` file should contain these variables
```
MONGO_URL=
MAPBOX_API_KEY=
MONGO_DB_NAME=solotrip
DB_URI=
FIREBASE_TYPE=
FIREBASE_PROJECT_ID=
FIREBASE_PRIVATE_KEY_ID=
FIREBASE_PRIVATE_KEY=
FIREBASE_CLIENT_EMAIL=
FIREBASE_CLIENT_ID=
FIREBASE_AUTH_URI=
FIREBASE_TOKEN_URI=
FIREBASE_AUTH_PROVIDER_X509_CERT_URL=
FIREBASE_CLIENT_X509_CERT_URL=
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

## Covid Status

```
docker run --env-file .env ghcr.io/solotrip/event-crawler:latest bash /app/scripts/covid-status.sh
```

## Send Notifications for Updates

```
docker run --env-file .env ghcr.io/solotrip/event-crawler:latest bash /app/scripts/send-notifications.sh
```

----

## Publishing Docker Image to Github Container Registry

```
bash build.sh
docker push ghcr.io/solotrip/event-crawler:latest
```
