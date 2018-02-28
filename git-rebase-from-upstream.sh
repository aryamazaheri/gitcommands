#!/bin/bash

# Add the remote, call it "upstream":
# git remote add upstream https://github.com/whoever/whatever.git
git remote show upstream 2>&1 | grep 'fatal' &> /dev/null
if [ $? == 0 ]; then
   echo "There is no upstream set for this repo. Please try to add an upstream with:\n> git remote add upstream https://github.com/whoever/whatever.git"
   exit 1
fi

# Fetch all the branches of that remote into remote-tracking branches,
# such as upstream/master:

git fetch upstream

# Make sure that you're on your master branch:

git checkout master

# Rewrite your master branch so that any commits of yours that
# aren't already in upstream/master are replayed on top of that
# other branch:

git rebase upstream/master
git push -f origin master

