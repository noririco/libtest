#!/bin/bash
git add .
git commit -m $1
npm version patch
PACKAGE_VERSION=$(cat ./package.json | grep \\\"version\\\" | head -1 | awk -F: '{ print $2 }' | sed 's/[\",]//g' | tr -d '[[:space:]]')
git tag -a "v$PACKAGE_VERSION"
git push
git push --tags