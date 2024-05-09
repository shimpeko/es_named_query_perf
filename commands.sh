#!/bin/bash

curl -X GET http://localhost:19200/_cluster/health?wait_for_status=green&timeout=30s
curl -X DELETE http://localhost:19200/_template/template_1
curl -X PUT http://localhost:19200/_template/template_1 -H 'Content-Type: application/json' --data "@index_template.json"
curl -X DELETE http://localhost:19200/test_index
curl -X PUT http://localhost:19200/test_index
curl -s -X POST http://localhost:19200/test_index/_bulk/?refresh=wait_for -H 'Content-Type: application/json' --data-binary "@bulk_requests.json" > /dev/null
echo ""
echo ""
echo "--- 1st RUN ---"
curl -X POST http://localhost:19200/test_index/_search?pretty=true -H 'Content-Type: application/json' --data "@query.json"
echo "--- 2nd RUN ---"
curl -X POST http://localhost:19200/test_index/_search?pretty=true -H 'Content-Type: application/json' --data "@query.json"
echo "--- 3rd RUN ---"
curl -X POST http://localhost:19200/test_index/_search?pretty=true -H 'Content-Type: application/json' --data "@query.json"
