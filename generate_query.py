import string
import random
import json

N = 4000

matches = []
for _ in range(N):
    text = ''.join(random.choices(string.ascii_lowercase, k=10))
    matches.append({"match": {"test_text": {"query": text, "_name": f"query = {text}"}}})

query = {
  "query": {
    "bool": {
      "should": matches
    }
  }
}
print(json.dumps(query))

