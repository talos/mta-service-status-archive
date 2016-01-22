#!/bin/bash -e

# Use a random number to make sure we don't get cached
# Eliminate the timestamp to kill unnecessary commits
#        (our timestamp is when the commit happened!)

curl "http://web.mta.info/status/serviceStatus.txt?_=$RANDOM"  | \
    sed -E 's:<timestamp>.*</timestamp>::g' \
    > serviceStatus.txt
git add serviceStatus.txt
git commit -m 'auto-commit'
git push origin master
