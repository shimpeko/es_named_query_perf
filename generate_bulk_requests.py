import string
import random
import json

N = 100000

for _ in range(N):
    text = ''.join(random.choices(string.ascii_lowercase, k=10))
    print(json.dumps({"index": {}}))
    print(json.dumps({"test_text": text}))
