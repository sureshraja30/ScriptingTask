#!/bin/bash

# URL to check
url="https://www.guvi.in"

# Get the HTTP status code using curl
http_status=$(curl -s -o /dev/null -w "%{http_code}" $url)

# Print the HTTP status code
echo "HTTP Status Code: $http_status"

# Check the status code and print success or failure message
if [[ "$http_status" -ge 200 && "$http_status" -lt 300 ]]; then
  echo "Success: The request was successful."
elif [[ "$http_status" -ge 300 && "$http_status" -lt 400 ]]; then
  echo "Redirection: The request was redirected."
elif [[ "$http_status" -ge 400 && "$http_status" -lt 500 ]]; then
  echo "Client Error: There was an error with the request."
elif [[ "$http_status" -ge 500 && "$http_status" -lt 600 ]]; then
  echo "Server Error: The server failed to fulfill the request."
else
  echo "Unexpected Response: Something went wrong."
fi

