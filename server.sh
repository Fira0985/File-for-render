#!/bin/sh
# Simple HTTP server on port 8080
while true; do
  echo -e "HTTP/1.1 200 OK\n\nRender MySQL is running" | nc -l -p 8080 -q 1
done
