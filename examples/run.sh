#!/usr/bin/env bash
# Run France Training Organizations & Qualiopi Database on Apify and print the results as JSON.
# export APIFY_TOKEN=your_token && bash run.sh
set -euo pipefail
curl -sS -X POST "https://api.apify.com/v2/acts/jet_mythology~france-training-organizations/run-sync-get-dataset-items?token=${APIFY_TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{"qualiopiOnly": true, "departments": ["33"], "minTrainees": 50}'
