cd /app/scrapotrip && \
node scrapers/events/festicket.js --output-file /app/out.jsonl && \
node scrapers/events/imageUploader.js && \
cd /app/solodata-external-data-proccessor && \
export EVENTS_JSON_PATH=/app/out.jsonl && \
python3 -m solodata.tasks.import_events_with_change_detection