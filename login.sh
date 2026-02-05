#MUST run after the user is registered using register.html.
curl -X 'POST' 'http://localhost:8080/api/login' -H 'accept: application/json' -H 'Content-Type: application/json' -d '{"email": "zhenglu.zhu@coconet.cn", "password": "zhuzhenglu"}' -c cookies.txt

