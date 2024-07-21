#!/bin/bash

if [ "$#" -gt 2 ] || [ "$#" -lt  1 ]; then
  echo "incorrect number of parameters"
  exit 1
fi

if [ ! -r vaccine.csv ]; then
  echo "vaccine.csv does not exist"
  exit 1
fi


if [ "$#" -eq 1 ]; then
  if ! cut -d, -f 1,5,17 vaccine.csv | grep -q "$1"; then
    echo "$1 is not a state
    exit 1
  fi
  cut -d, -f 1,5,17 vaccine.csv | grep -q "$1" | sort -t -k1.7,1.1 -k1.1,1,2 -k1.4,1.5 | tail -n 1
fi

if [ "$# -e 2 ]; then
  if ! cut -d, -f 1,5,17 vaccine.csv | grep "$1" && grep "$2"; then
    echo "either $1 is not a state or $2 is not a valid date"
    exit 1
  fi
  cut -d, -f 1,5,17 vaccine.csv | grep -E "^$2,$1,.*$"
fi

exit 0
