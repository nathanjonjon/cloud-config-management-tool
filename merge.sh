#! /bin/bash
# Merge pushes to development branch to stable branch
if [ ! -n $3 ] ; then
    echo "Usage: merge.sh <username> <password> <branch>"
    exit 1;
fi

GIT_USER="$1"
GIT_PASS="$2"

# Specify the development branch and stable branch names
FROM_BRANCH="$3"
CURRENT_BRANCH="$3"
TO_BRANCH="dev"


# Create the URL to push merge to 
URL="https://github.com/$GIT_USER/nextlinker_cmdb.git"
echo "Repo url is $URL"
PUSH_URL="https://$GIT_USER:$GIT_PASS@${URL:6}"

if [ "$CURRENT_BRANCH" = "$FROM_BRANCH" ] ; then
    # Checkout the dev branch
    #git checkout $FROM_BRANCH && \
    #echo "Checking out $TO_BRANCH..." && \

    # Checkout the latest stable
    git fetch origin $TO_BRANCH:$TO_BRANCH && \
    git checkout $TO_BRANCH && \

    # Merge the dev into latest stable
    echo "Merging changes..." && \
    git merge $FROM_BRANCH && \

    git add .
    git commit --allow-empty -m "please"
    # Push changes back to remote vcs
    echo "Pushing changes..." && \
    git push $PUSH_URL && \
    echo "Merge complete!" || \
    echo "Error Occurred. Merge failed"
else
    echo "Not on $FROM_BRANCH. Skipping merge"
fi