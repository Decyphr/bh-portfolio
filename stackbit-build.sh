#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e5b1bbb4240be001adee49d/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e5b1bbb4240be001adee49d
curl -s -X POST https://api.stackbit.com/project/5e5b1bbb4240be001adee49d/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e5b1bbb4240be001adee49d/webhook/build/publish > /dev/null
