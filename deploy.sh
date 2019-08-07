#!/bin/bash

# terminate in case of failure
# http://stackoverflow.com/questions/4381618/exit-a-script-on-error
set -e 

# http://unix.stackexchange.com/questions/12068/how-to-measure-time-of-program-execution-and-store-that-inside-a-variable
START=$(date +%s)

# 8/7/2019: move to github pages, see https://pages.github.com/ for more info. Github pages does not support
# subdomains, so there's no opportunity to have a "staging" website anymore. To save $15.99 a month I think
# this is worth this, since I have only needed to use a staging website when creating new content. I do this 
# very rarely, about once every five years.
# if [[ "${1}" == "staging" ]] 
#     then
#     echo 'building staging...'
#     jekyll build --config _config_staging.yml

#     echo 'deploying staging...'
#     rsync -rav -e ssh _site/* notjulie@notjulie.com:public_html/js_net
# elif [[ "${1}" == "release" ]]
#     then
#     echo 'building release...'
#     jekyll build --config _config_release.yml

#     echo 'deploying release...'
#     rsync -rav -e ssh _site/* notjulie@notjulie.com:public_html/notjulie
#     rsync -rav -e ssh .htaccess notjulie@notjulie.com:public_html/notjulie/.htaccess
# else
#     echo "${0} [staging|release]"
#     exit 1
# fi

echo 'building release...'
jekyll build --config _config_githubio.yml

echo 'deploying release...'
# To deploy, I now need to copy contents of _site/ into ../julenka.github.io
# then commit and push changes
# This puts folder A into folder B:
# rsync -avu --delete "/home/user/A" "/home/user/B"

# Do not delete aka mirror the site, because that will delete the .git folder
PAGES_REPO_PATH="../julenka.github.io"
rsync -avu _site/ $PAGES_REPO_PATH

pushd $PAGES_REPO_PATH
DATESTR=$(date)
git add --all .
git commit -m "Update site $DATE"
git push
popd

END=$(date +%s)
DIFF=$(echo "$END - $START" | bc)

echo "deploy took ${DIFF} seconds"
