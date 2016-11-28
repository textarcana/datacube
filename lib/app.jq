# There is just one record schema: the triple.

def schema:
  {
   "timestamp": now | floor,
   "event": {},
   "relationship": {}
   }
;

def metric($event; $relationship):
schema | .event=$event | .relationship=$relationship
;


metric({foo:1}; {bar:2})
