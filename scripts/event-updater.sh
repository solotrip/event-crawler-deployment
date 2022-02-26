cd /app/scrapotrip
# Run scrapers in parallel
[[ -z $NO_EVERFEST ]] && node scrapers/events/everfest.js --output-file /app/everfest-out.jsonl &
[[ -z $NO_FESTICKET ]] && node scrapers/events/festicket.js --output-file /app/festicket-out.jsonl &
[[ -z $NO_RADSEASON ]] && node scrapers/events/radseason.js --output-file /app/radseason-out.jsonl &
wait

cd /app/solodata-external-data-proccessor
[[ -z $NO_EVERFEST ]] && export EVENTS_JSON_PATH=/app/everfest-out.jsonl &&
python3 -m solodata.tasks.import_events_with_change_detection
[[ -z $NO_FESTICKET ]] && export EVENTS_JSON_PATH=/app/festicket-out.jsonl && \
python3 -m solodata.tasks.import_events_with_change_detection
[[ -z $NO_RADSEASON ]] && export EVENTS_JSON_PATH=/app/radseason-out.jsonl && \
python3 -m solodata.tasks.import_events_with_change_detection

[[ -z $NO_IMG_UPLOAD ]] && cd /app/scrapotrip && \
node scrapers/events/imageUploader.js
[[ -z $NO_SCORE_UPDATE ]] && cd /app/solodata-external-data-proccessor && \
python3 -m solodata.tasks.calculate_recommendation_event_scores

[[ -z $NO_NOTIFICATION ]] && cd /app/solotrip-backend && \
node scripts/update-recommendations.js
