#!/usr/bin/env bash

event_key_store_path="/tmp/event_key_store"

store_event_by_key()
{
    eventKey=$1
    recordJson=$2

    echo $eventKey \
        | tr '.' '/' \
        | xargs -I@ mkdir -p "$event_key_store_path/@"


}

dcube_write()
{

    eventKey=$1
    eventValue=$2
    relationshipKey=$3
    relationshipValue=$4

    json_document=$(
        jq -n \
           --argjson eventArg "{\"$eventKey\": \"$eventValue\"}" \
           --argjson relationshipArg "{\"$3\": \"$4\"}" \
           -f "lib/app.jq")

    document_hash=$(
        echo $json_document \
            | shasum -a 256 \
            | cut -d' ' -f1)

}
