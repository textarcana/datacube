# There is just one record schema: the triple.

def schema:
  {
   "timestamp": null,
   "event": {},
   "relationship": {}
   }
;

def create_record($timestamp; $event; $relationship):
schema
  | .timestamp=$timestamp
  | .event=$event
  | .relationship=$relationship
;

create_record($timestampArg;
              $eventArg;
              $relationshipArg)
