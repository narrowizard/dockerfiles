apk update
apk add fcgi
SCRIPT_NAME=/status SCRIPT_FILENAME=/status QUERY_STRING=full REQUEST_METHOD=GET cgi-fcgi -bind -connect 127.0.0.1:9000