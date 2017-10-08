#!/bin/bash

export MAVEN_OPTS="-Dmaven.repo.local=$PWD/.m2"
echo $MAVEN_OPTS

echo "./mvnw dependency:go-offline"
./mvnw dependency:go-offline

echo "./mvnw -o verify"
./mvnw -o verify

