#!/bin/sh

oldipaname=$1

unzip "$1.ipa"

codesign -d --entitlements :entitlements.plist Payload/"$1.app"/

rm -r Payload
