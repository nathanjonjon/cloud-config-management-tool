#!/bin/sh
echo $1
echo $2

project_id=$(curl -XGET \
    -u admin:password \
    "http://0.0.0.0/api/v2/projects/?name=$1" 2>/dev/null | jq -r '.results[0].id')

# project_id=$(curl -XGET \
#     -u admin:password \
#     "http://0.0.0.0/api/v2/projects/?name=awx_webhook" 2>/dev/null | jq -r '.results[0].id')

template_id=$(curl -XGET \
    -u admin:password \
    "http://0.0.0.0/api/v2/job_templates/?project=$project_id&name=plan_awx_webhook" 2>/dev/null | jq -r '.results[0].id')

echo $project_id
echo $template_id

curl -XPOST -H "Content-Type: application/json" \
    --data "{}" \
    -u admin:password  \
    http://0.0.0.0/api/v2/job_templates/$template_id/launch

#curl -XGET -u admin:password "http://0.0.0.0/api/v2/job_templates/?project=8"