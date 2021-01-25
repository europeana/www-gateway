#!/bin/sh

# Arguments:
# 1. CF API
# 2. CF username
# 3. CF password
# 4. CF org
# 5. CF space
# 6. CF app name
# 7. Docker image

cf api $1
cf auth $2 $3
cf target -o $4 -s $5
cf push $6 -o $7 --strategy rolling
