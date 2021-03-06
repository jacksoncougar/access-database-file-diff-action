#!/bin/sh

BEFORE="${2%.accdb}.json"
AFTER="${1%.accdb}.json"
ACCESS_TO_JSON="${GITHUB_ACTION_PATH}/export-accdb-tables-to-json.sh"

echo "2: $2" >&2
echo "1: $1" >&2

$ACCESS_TO_JSON "$2" "$BEFORE"
$ACCESS_TO_JSON "$1" "$AFTER"

git diff --no-ext-diff --no-index "$AFTER" "$BEFORE"