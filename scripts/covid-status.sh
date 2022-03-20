cd /app/scrapotrip && \
node scripts/update-covid-restrictions.js
[[ -z $NO_NOTIFICATION ]] && cd /app/solotrip-backend && \
node scripts/update-recommendations.js
