cd /app/scrapotrip && \
node scripts/update-covid-restrictions.js && \
node scripts/update-safety.js
[[ -z $NO_NOTIFICATION ]] && cd /app/solotrip-backend && \
node scripts/update-recommendations.js
