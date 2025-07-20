#!/bin/bash

UPDATE=$1
CLASSPATH_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}/classpath-generator"
INIT_GRADLE_URL="https://raw.githubusercontent.com/PEMessage/android-classpath-generator/refs/heads/main/init.gradle"
INIT_GRADLE="$CLASSPATH_CACHE_HOME/init.gradle"


if [ ! -f "$INIT_GRADLE" ] || [ "$UPDATE" = -u ]; then
    mkdir -p "$CLASSPATH_CACHE_HOME"
    curl -# -L -o "$INIT_GRADLE" "$INIT_GRADLE_URL"
fi

if [ ! -f gradlew ] ; then
    echo "./gradlew not founded"
    exit 1
fi

if [ -f "$CLASSPATH_CACHE_SCRIPT" ] ; then
    ./gradlew -I "$CLASSPATH_CACHE_SCRIPT" eclipse
else
    echo "internal error"
fi
