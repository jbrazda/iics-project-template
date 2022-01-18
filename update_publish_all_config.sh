#!/bin/bash

# Script to generate new Publish all descriptor for iics package command generating publish in following order
# 1. Connectors
# 2. Connections
# 3. Processes
# 4. Guides
# this program must run with GNU sed available install gnu sed on mac via ports or brew
# Manual Run
# find ./src/iics -name "*.AI_SERVICE_CONNECTOR.xml" | gsed -r 's/(\.\/src\/iics\/)|(\.xml)//g' && \
# find ./src/iics -name "*.AI_CONNECTION.xml" | gsed -r 's/(\.\/src\/iics\/)|(\.xml)//g' && \
# find ./src/iics -name "*.PROCESS.xml" | gsed -r 's/(\.\/src\/iics\/)|(\.xml)//g' && \
# find ./src/iics -name "*.GUIDE.xml" | gsed -r 's/(\.\/src\/iics\/)|(\.xml)//g'\

# check system 
UNAME=$(uname)

case "$UNAME" in
Darwin*) sed_exec='gsed';;
*) sed_exec='sed';;
esac


find ./src/iics -name "*.AI_SERVICE_CONNECTOR.xml" | "$sed_exec" -r 's/(\.\/src\/iics\/)|(\.xml)//g' > conf/all_designs.publish.txt && \
find ./src/iics -name "*.AI_CONNECTION.xml" | "$sed_exec" -r 's/(\.\/src\/iics\/)|(\.xml)//g' >> conf/all_designs.publish.txt && \
find ./src/iics -name "*.PROCESS.xml" | "$sed_exec" -r 's/(\.\/src\/iics\/)|(\.xml)//g' >> conf/all_designs.publish.txt && \
find ./src/iics -name "*.GUIDE.xml" | "$sed_exec" -r 's/(\.\/src\/iics\/)|(\.xml)//g' >> conf/all_designs.publish.txt

echo 'conf/all_designs.publish.txt Updated'


git diff conf/all_designs.publish.txt