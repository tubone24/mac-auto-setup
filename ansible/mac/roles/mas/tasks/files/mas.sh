#!/bin/bash

APPID=$1

## Argument check
test $# -eq 1 || exit 2

## App check
mas list 2> /dev/null | grep -q "^${APPID} " && exit 0

## App install
mas install ${APPID} > /dev/null 2>&1 || exit 3

## Normal termination
exit 0