#!/bin/bash

# CHANGE THESE BEFORE RUNNING THE SCRIPT!
releaseVersion=6.0.5
devmentVersion=6.0.6-SNAPSHOT

git checkout dev

# The Maven release
mvn --batch-mode release:branch -DbranchName=release/release-$releaseVersion -DreleaseVersion=$releaseVersion -DdevmentVersion=$devmentVersion


