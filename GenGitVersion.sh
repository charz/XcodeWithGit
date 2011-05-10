#!/bin/sh

#  GenGitVersion.sh
#
#  Created by Charz on 2011/3/25.
#  Copyright 2011年 Chhsu, Inc. All rights reserved.
#
#  use cmd to add tag version:
#	git tag -a "0.0.1" -m "version 0.0.1"
#

project="UILabelSample"

git=`whereis git`

version=`$git describe`
versionNum=`echo $version | sed 's/\-[0-9]*\-[a-zA-Z0-9]*//'`
versionBundle=`echo $version | sed 's/[0-9.]*\-\([0-9]*\)\-\(.*\)/\1/'`
if [ $versionBundle == $version ] ; then 
	versionBundle=0
fi

echo ${versionNum}
echo ${versionBundle}

/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString '$versionNum'"  ${PROJECT_DIR}/${PRODUCT_NAME}/${project}-Info.plist
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion '$versionBundle'"  ${PROJECT_DIR}/${PRODUCT_NAME}/${project}-Info.plist
