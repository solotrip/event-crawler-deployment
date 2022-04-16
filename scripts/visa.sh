cd /app/scrapotrip && \
npm run visa
[[ -z $NO_NOTIFICATION ]] && cd /app/solotrip-backend && node scripts/update-recommendations.js
