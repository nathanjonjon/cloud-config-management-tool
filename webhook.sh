echo i am handsome
curl -i -X POST -H 'Content-Type: application/json' -d '{"text": "Nextlinker Assemble!\n message from $TRAVIS_BRANCH"}' $mattermost_url
