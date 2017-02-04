#!/bin/sh

oldipaname="codesigndemo"
mobileprovisionname="bundle.mobileprovision"
distributionname="iPhone Developer: gan wang (V2C45S8B76)"
entitlements="Entitlements.plist"

#解压ipa
oldipa="$oldipaname.ipa"
unzip $oldipa

#更换证书
oldapp="$oldipaname.app"
cp $mobileprovisionname Payload/$oldapp/embedded.mobileprovision

#重签名
echo $oldapp
codesign -f -s $distributionname --entitlements $entitlements Payload/$oldapp

#重新生成ipa
newipa="$oldipaname-new.ipa"
path=$(pwd)
xcrun -sdk iphoneos PackageApplication -v Payload/$oldapp  -o $path/$newipa


rm -r Payload
