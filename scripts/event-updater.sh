cd /app/scrapotrip
# Run scrapers in parallel
node scrapers/events/everfest.js --output-file /app/everfest-out.jsonl &
node scrapers/events/festicket.js --output-file /app/festicket-out.jsonl &
node scrapers/events/radseason.js --output-file /app/radseason-out.jsonl &
wait

cd /app/solodata-external-data-proccessor
export EVENTS_JSON_PATH=/app/everfest-out.jsonl && \
python3 -m solodata.tasks.import_events_with_change_detection
export EVENTS_JSON_PATH=/app/festicket-out.jsonl && \
python3 -m solodata.tasks.import_events_with_change_detection
export EVENTS_JSON_PATH=/app/radseason-out.jsonl && \
python3 -m solodata.tasks.import_events_with_change_detection

cd /app/scrapotrip && \
node scrapers/events/imageUploader.js && \
cd /app/solodata-external-data-proccessor && \
python3 -m solodata.tasks.calculate_recommendation_event_scores

cd /app/solotrip-backend && \
node scripts/update-recommendations.js
