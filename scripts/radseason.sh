cd /app/scrapotrip && \
node scrapers/events/radseason.js --output-file /app/out.jsonl && \
cd /app/solodata-external-data-proccessor && \
export EVENTS_JSON_PATH=/app/out.jsonl && \
python3 -m solodata.tasks.import_events_with_change_detection