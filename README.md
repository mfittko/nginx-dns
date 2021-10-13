# nginx-dns
simple NGNIX based dns service that routes IP addresses encoded into subdomains to their corresponding upstream backends

## Usage (testing)

Given you have a backend server running on localhost and port 3000:
```bash
# add host to hosts file (run once!)
echo '127.0.0.1 foo-172-17-0-1-www.localhost.com' | sudo tee -a /etc/hosts
PROXY_PORT=8081 PROXY_REALM="Test proxy" NGINX_HOST="www\.localhost\.com" BACKEND_PORT=3000 HTTP_BASIC_USER=foo HTTP_BASIC_PASS=bar docker-compose up
```

Now open following url:
http://foo-172-17-0-1-www.localhost.com:8081/