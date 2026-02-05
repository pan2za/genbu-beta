 curl -v -X 'POST' 'http://localhost:8080/api/files/upload' -H 'accept: application/json' -H 'Content-Type: application/json' -d '{"name": "test.docx", "size": 1230}' -b cookies.txt
