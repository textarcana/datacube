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

def validate($timestamp; $event; $relationship):

if (($timestamp | type) != "number") then
  error("\"\($timestamp)\" is an invalid timestamp")
else
  create_record($timestamp; $event; $relationship)
end

;

validate(now|floor; {foo:1}; {bar:2})
