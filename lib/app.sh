#!/usr/bin/env bash

dcube_write()
{

    eventKey=$1
    eventValue=$2
    relationshipKey=$3
    relationshipValue=$4

    jq -n \
       --argjson eventArg "{\"$eventKey\": \"$eventValue\"}" \
       --argjson relationshipArg "{\"$3\": \"$4\"}" \
       -f "lib/app.jq"

}
