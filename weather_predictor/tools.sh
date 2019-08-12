#!/bin/bash
# Copyright (c) 2018 Oracle and/or its affiliates. All rights reserved.
# This file is made available under version 3 of the GNU General Public License.


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

: ${JAVA_HOME?"JAVA_HOME must point to a GraalVM image"}

# Run demo with tools enabled and with exceptions being printed to command line
${JAVA_HOME}/bin/node ${GRAALVM_ADDITIONAL_ARGS} --jvm --vm.Xss2m --vm.classpath=${dir}/bin --ruby.load-paths=${dir}/openweather/lib,${dir} --polyglot --inspect --inspect.Suspend=false --agent ${dir}/weatherServer.js
