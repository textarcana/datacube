#!/usr/bin/env bash

event_key_store_path="/tmp/event_key_store/facts"

dcube_write()
{

    eventKey=$1
    eventValue=$2
    relationshipKey=$3
    relationshipValue=$4
    timestamp=$5

    store_at_path=$(
        echo $eventKey \
            | tr '.' '/' \
            | echo "$event_key_store_path/$eventKey/$timestamp")

echo $store_at_path

mkdir -p $store_at_path

    jq --sort-keys\
       -c -n \
       --argjson eventArg "{\"$eventKey\": \"$eventValue\"}" \
       --argjson relationshipArg "{\"$3\": \"$4\"}" \
       -f "lib/app.jq" > "$store_at_path/$eventValue"

}
