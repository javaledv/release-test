#!/bin/bash

# CHANGE THESE BEFORE RUNNING THE SCRIPT!
releaseVersion=4.0.1
devmentVersion=4.0.2-SNAPSHOT

git checkout dev

# The Maven release
mvn --batch-mode release:branch -DbranchName=release/release-$releaseVersion -DreleaseVersion=$releaseVersion -DdevmentVersion=$devmentVersion


