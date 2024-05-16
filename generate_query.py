import string
import random
import json
import pathlib

N = 4000

matches = []

i = 0
for req_body in pathlib.Path('bulk_requests.json').read_text().splitlines():
    req = json.loads(req_body)
    if not req.get("test_text"):
        continue
    if i >= N:
        break
    matches.append({"match": {"test_text": {"query": req["test_text"], "_name": f"query = {req['test_text']}"}}})
    i = i + 1

query = {
  "query": {
    "bool": {
      "should": matches
    }
  }
}
print(json.dumps(query))

