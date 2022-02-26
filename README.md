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
S3_ACCESS_KEY_ID=
S3_SECRET_ACCESS_KEY=
S3_REGION=eu-central-1
```

## ULTIMATE Event Updater

```
docker run --env-file .env ghcr.io/solotrip/event-crawler:latest bash /app/scripts/event-updater.sh
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


## Publishing Docker Image to ECR

```
aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 706840910256.dkr.ecr.eu-central-1.amazonaws.com
docker push 706840910256.dkr.ecr.eu-central-1.amazonaws.com/pulfy-jobs:latest
```
