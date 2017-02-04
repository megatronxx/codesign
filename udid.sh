#!/bin/sh

##input need
echo $1
mobileprovisionFileName=$1
echo $mobileprovisionFileName
mobileprovision_uuid=`/usr/libexec/PlistBuddy -c "Print UUID" /dev/stdin <<< $(/usr/bin/security cms -D -i ${mobileprovisionFileName})`
echo "UUID is:"
echo ${mobileprovision_uuid}
