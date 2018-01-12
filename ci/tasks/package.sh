#!/bin/bash

set -e +x

pushd movies-fun-source
  echo "Packaging WAR"
  ./mvnw clean package -DskipTests
popd

jar_count=`find movies-fun-source/target -type f -name *.war | wc -l`

if [ $jar_count -gt 1 ]; then
  echo "More than one war found, don't know which one to deploy. Exiting"
  exit 1
fi

find movies-fun-source/target -type f -name *.war -exec cp "{}" package-output/movies-fun-service.war \;

echo "Done packaging"
exit 0
