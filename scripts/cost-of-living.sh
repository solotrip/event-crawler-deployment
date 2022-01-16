cd /app/scrapotrip && \
node scrapers/cost-of-living/match/matchAreas.js && \
node scrapers/cost-of-living/match/matchCountries.js && \
node scrapers/cost-of-living/fetch/fetchAreaCosts.js && \
node scrapers/cost-of-living/fetch/fetchCountryCosts.js && \
node scrapers/cost-of-living/upload/uploadCosts.js 