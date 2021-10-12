cd /app/scrapotrip && \
node scrapers/covid-status/kayak-restrictions.js && \
node scrapers/covid-status/airtable.js && \
node scrapers/covid-status/airtable-proccessor.js && \
node scrapers/covid-status/airtable-update-tracker.js && \
node scrapers/covid-status/airtable-mongo-uploader.js
