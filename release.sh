#!/bin/bash

# CHANGE THESE BEFORE RUNNING THE SCRIPT!
releaseVersion=4.0.4
devmentVersion=4.0.5-SNAPSHOT

git checkout release/release-$releaseVersion

mvn --batch-mode release:prepare release:perform -DscmCommentPrefix="$scmCommentPrefix" -DreleaseVersion=$releaseVersion -DdevmentVersion=$devmentVersion

git checkout dev
git merge --no-ff -m "$scmCommentPrefix Merge release/release-$releaseVersion into dev" release/release-$releaseVersion
git checkout master
git merge --no-ff -m "$scmCommentPrefix Merge release/release-$releaseVersion into master" release/release-$releaseVersion
git branch -D release/release-$releaseVersion
git push origin --delete release/release-$releaseVersion
git checkout dev
git push --all && git push --tags