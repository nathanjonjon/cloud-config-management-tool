if [ ! -n $2 ] ; then
    echo "Usage: webhook.sh <url> <branch>"
    exit 1;
fi

mattermost_url="$1"
branch="$2"

# Specify the development branch and stable branch names

echo i am handsome
curl -i -X POST -H 'Content-Type: application/json' -d '{"text": "'the branch is "$branch"'"}' $mattermost_url
