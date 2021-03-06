#!/usr/bin/env bash

# Copyright 2014 Alexander Fahlke
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

bin=`which $0`
bin=`dirname ${bin}`
bin=`cd "$bin"; pwd`

export OOZIE_TOOL_CONF_DIR="$bin"/../conf

# usage message
usage(){
	echo "Usage: $0 <coordinator id> <action>"
	exit 1
}

# check for parameter (coordinator id)
[[ $# -ne 2 ]] && usage

if [ ! -f "${OOZIE_TOOL_CONF_DIR}/config.ini" ]; then
	echo "config.ini not found!"
	exit 2
fi
source "${OOZIE_TOOL_CONF_DIR}/config.ini"

OOZIE_COORDINATOR_ID=$1
OOZIE_COORDINATOR_ACTION_ID=$2

# rerun given coordinator actions
${OOZIE_BIN} job -oozie http://${OOZIE_HOSTNAME}:${OOZIE_PORT}/oozie -rerun ${OOZIE_COORDINATOR_ID} -action ${OOZIE_COORDINATOR_ACTION_ID}
