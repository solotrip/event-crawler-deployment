FROM nikolaik/python-nodejs:python3.7-nodejs12

WORKDIR /app
COPY . .
RUN cd /app/scrapotrip && npm install
RUN cd /app/solodata-external-data-proccessor && pip install -r requirements.txt
RUN cd /app/solotrip-backend && npm install
