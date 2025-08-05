#!/bin/bash

set -e

echo "DEBUG OK 1 $ORGA"
RUNNER_NAME="az-rts-si-runnercont-$(hostname)"
RUNNER_WORKDIR="/home/runner"
LABELS="az-rts-si"
echo $GITHUB_PAT $REGISTRATION_TOKEN_API_URL
echo $REGISTRATION_TOKEN_API_URL
RUNNER_TOKEN="$(curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_PAT" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/orgs/$ORGA/actions/runners/registration-token \
  | jq -r '.token')"

echo $RUNNER_TOKEN
if [ -z "$RUNNER_TOKEN" ]; then
  echo "Fatal error, check GitHub CLI auth."
  exit 1
fi
echo $RUNNER_TOKEN
echo "DEBUG OK 2 TOKEN"

./config.sh \
  --url https://github.com/$ORGA \
  --token "$RUNNER_TOKEN" \
  --name "$RUNNER_NAME" \
  --work "$RUNNER_WORKDIR" \
  --labels "$LABELS" \
  --unattended \
  --replace

./run.sh

