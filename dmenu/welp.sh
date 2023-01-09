#!/bin/sh
IFS=":"
for dir in $XDG_DATA_DIRS
do
  echo $dir
done
