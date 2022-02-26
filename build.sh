rm -rf solodata-external-data-proccessor
rm -rf scrapotrip
rm -rf solotrip-backend

git clone --depth 1 https://github.com/solotrip/solodata-external-data-proccessor.git
git clone --depth 1 https://github.com/solotrip/scrapotrip.git
git clone --depth 1 --branch develop https://github.com/solotrip/solotrip-backend.git

docker build -t solotrip/event-crawler:latest -t ghcr.io/solotrip/event-crawler:latest -t 706840910256.dkr.ecr.eu-central-1.amazonaws.com/pulfy-jobs:latest .
