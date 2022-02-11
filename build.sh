git clone --depth 1 https://github.com/solotrip/solodata-external-data-proccessor.git
git clone --depth 1 https://github.com/solotrip/scrapotrip.git
git clone --depth 1 https://github.com/solotrip/solotrip-backend.git

docker build -t solotrip/event-crawler:latest -t ghcr.io/solotrip/event-crawler:latest .
