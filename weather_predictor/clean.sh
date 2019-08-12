#!/bin/bash
# Copyright (c) 2018 Oracle and/or its affiliates. All rights reserved.
# This file is made available under version 3 of the GNU General Public License.


set -e

# Resolve the location of this script
source="${BASH_SOURCE[0]}"
while [ -h "$source" ] ; do
  prev_source="$source"
  source="$(readlink "$source")";
  if [[ "$source" != /* ]]; then
    # if the link was relative, it was relative to where it came from
    dir="$( cd -P "$( dirname "$prev_source" )" && pwd )"
    source="$dir/$source"
  fi
done
dir="$( cd -P "$( dirname "$source" )" && pwd )"

rm -rf ${dir}/bin
rm -rf ${dir}/node_modules
rm -rf ${dir}/openweather
