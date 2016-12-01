#!/usr/bin/env bash

event_key_store_path="/tmp/event_key_store/facts"

event_key_as_path()
{
    key_as_path=$(
        echo $event_key \
            | tr '.' '/')

    echo "$event_key_store_path/$key_as_path"
}

dcube_write()
{

    event_key=$1
    event_value=$2
    relationship_key=$3
    relationship_value=$4
    timestamp=$5

    store_at_path="$(event_key_as_path $event_key)/$timestamp"

    mkdir -p $store_at_path

    jq --sort-keys\
       -c -n \
       --argjson eventArg "{\"$event_key\": \"$event_value\"}" \
       --argjson relationshipArg "{\"$relationship_key\": \"$relationship_value\"}" \
       --argjson timestampArg $timestamp \
       -f "lib/app.jq" \
       > "$store_at_path/$event_value.json"

}

dcube_read()
{
    event_key=$1

    read_from_path="$(event_key_as_path $event_key)"

    echo $read_from_path
}
