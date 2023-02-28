#!/usr/bin/env bash

SMOKE_TEST=true
FULL=$1

if [ -z "$FULL" ]; then
  echo "boolean value not set, defaulting to Smoke Test: $SMOKE_TEST"
  echo ""
fi

sm --start CIP_EMAIL_VERIFICATION_ALL -r
sbt -Dperftest.runSmokeTest=${FULL:=$SMOKE_TEST} -DrunLocal=true gatling:test
sm --stop CIP_EMAIL_VERIFICATION_ALL -r
