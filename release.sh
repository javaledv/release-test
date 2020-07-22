#!/bin/bash

# CHANGE THESE BEFORE RUNNING THE SCRIPT!
releaseVersion=5.0.5
devmentVersion=5.0.6-SNAPSHOT

git checkout release/release-$releaseVersion

mvn --batch-mode release:prepare release:perform -DscmCommentPrefix="$scmCommentPrefix" -DreleaseVersion=$releaseVersion -DdevmentVersion=$devmentVersion

git checkout dev
git merge --no-ff -m "$scmCommentPrefix Merge release/release-$releaseVersion into dev" release/release-$releaseVersion
git checkout master
git merge --no-ff -m "$scmCommentPrefix Merge release/release-$releaseVersion into master" release/release-$releaseVersion
git branch -D release/release-$releaseVersion
# Uncomment this for deleting origin branch
# git push origin --delete release/release-$releaseVersion
git checkout dev
git push --all && git push --tags