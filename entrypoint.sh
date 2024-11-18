#!/bin/sh

if [ $1 == "backup" ]; then
  HANDLE=$2
  DESTURL=$3
  if [ -z "$HANDLE" ]; then
    echo "No handle provided"
    exit 1
  fi
  if [ -z "$DESTURL" ]; then
    echo "No destination URL provided"
    exit 1
  fi
  echo "Backup $HANDLE to $DESTURL"
  mkdir /tmp/backup && cd /tmp/backup && /usr/local/bin/goat repo export $HANDLE
  aws s3 cp --recursive /tmp/backup/ $DESTURL
else
  /usr/local/bin/goat "$@"
fi