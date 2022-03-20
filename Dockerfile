FROM nikolaik/python-nodejs:python3.7-nodejs12

WORKDIR /app
RUN apt-get update -y && apt-get install -y \
 gconf-service libasound2 libatk1.0-0 libc6 \
 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 \
 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 \
 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 \
 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 \
 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates \
 fonts-liberation libappindicator1 libnss3 lsb-release \
 xdg-utils libatk-bridge2.0-0 libgbm1
COPY . .
RUN useradd -u 1001 -r -g root -m -d /nonroot -s /sbin/nologin -c "App user" nonroot && \
    chmod 755 /nonroot && \
    chown -R nonroot:root /app && \
    chown -R nonroot:root /var/lib
RUN cd /app/scrapotrip && npm install
RUN cd /app/solodata-external-data-proccessor && pip install -r requirements.txt
RUN cd /app/solotrip-backend && npm install
USER nonroot
