#!/bin/sh -e

################################################################################
##
##  Licensed to the Apache Software Foundation (ASF) under one or more
##  contributor license agreements.  See the NOTICE file distributed with
##  this work for additional information regarding copyright ownership.
##  The ASF licenses this file to You under the Apache License, Version 2.0
##  (the "License"); you may not use this file except in compliance with
##  the License.  You may obtain a copy of the License at
##
##      http://www.apache.org/licenses/LICENSE-2.0
##
##  Unless required by applicable law or agreed to in writing, software
##  distributed under the License is distributed on an "AS IS" BASIS,
##  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
##  See the License for the specific language governing permissions and
##  limitations under the License.
##
################################################################################


# This script release branch for the next Apache FlexUnit version

if [ $# -ne 1 ]
then
    echo Usage: make_release_branch [0-100].[0-100].[0-1000]
fi

FLEXUNIT_VERSION="$1"
CHECK=`echo "$FLEXUNIT_VERSION" | grep -q -E '[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,3}$'`

if [ $? -ne 0 ]
then
	echo "Apache FlexUnit version needs to be in the form [0-100].[0-100].[0-1000]"
	exit 1;
fi

echo "Creating branch for Apache FlexUnit Version ${FLEXUNIT_VERSION}"

git push -u origin develop:release${FLEXUNIT_VERSION}

cd ..
mkdir "ApacheFlexUnit${FLEXUNIT_VERSION}"
cd "ApacheFlexUnit${FLEXUNIT_VERSION}"
git clone https://git-wip-us.apache.org/repos/asf/flex-flexunit .
git checkout release${FLEXUNIT_VERSION}
git tag -a apache-flexunit-${FLEXUNIT_VERSION}RC1 -m \'"Apache FlexUnit ${FLEXUNIT_VERSION} RC1"\'
git push --tags
