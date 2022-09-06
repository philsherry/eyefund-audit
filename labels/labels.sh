#!/usr/bin/env bash
# shellcheck source=/dev/null
# shellcheck disable=SC2059,SC2086,SC2154
# set -e
# set -v
# set -x

HEADERS="Accept: application/vnd.github+json"
OWNER="philsherry"
REPO="eyefund-audit"
FILE="./labels.json"
ROWS=$(cat ${FILE} | jq -r '.[] | length')

## Remove all new line, carriage return, tab characters
## from the string, to allow integer comparison
## https://stackoverflow.com/a/48705290/6246995
ROWS="${ROWS//[$'\t\r\n ']}"

_gh() {
	gh api \
		--method POST \
		--header "$HEADERS" \
		"/repos/$OWNER/$REPO/labels" \
		--field name="$(_jq '.name')" \
		--field description="$(_jq '.description')" \
		--field color="$(_jq '.color')";
	sleep 2;
}

_jq() {
	echo "${row}" | base64 --decode | jq -r "${1}"
}

for row in $(cat ${FILE} | jq -r '.[] | @base64'); do
	_jq;
	_gh;
done
