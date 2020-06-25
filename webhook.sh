if [ ! -n $3 ] ; then
    echo "Usage: webhook.sh <url> <branch> <commit>"
    exit 1;
fi

mattermost_url="$1"
branch="$2"
commit="$3"

# Specify the development branch and stable branch names

echo i am handsome
curl -i -X POST -H 'Content-Type: application/json' -d '{"text": "current branch is '"$branch"'\ncommit id is '"$commit"'"}' $mattermost_url