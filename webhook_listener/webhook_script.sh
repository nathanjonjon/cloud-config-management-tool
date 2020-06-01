#!/bin/sh
echo "Repo name is $1"
echo "Github Project owner is $2"
echo $type

project_id=$(curl -XGET \
    -u admin:password \
    "http://0.0.0.0/api/v2/projects/?name=$1" 2>/dev/null | jq -r '.results[0].id')

template_id=$(curl -XGET \
    -u admin:password \
    "http://0.0.0.0/api/v2/job_templates/?project=$project_id&name=plan_nextlinker_cmdb" 2>/dev/null | jq -r '.results[0].id')

echo $project_id
echo $template_id

curl -qsOL -XPOST -H "Content-type: application/json" \
    --data '{}' \
    -u admin:password  \
    http://0.0.0.0/api/v2/job_templates/$template_id/launch
