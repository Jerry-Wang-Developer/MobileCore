#!/bin/bash

# Xcode run script entry.

set -e

scripts=(
    "swiftformat.py"
)

current_dir=$(cd "$(dirname "$0")"; pwd)

pushd $current_dir > /dev/null

for script in ${scripts[@]}
do 
    echo "++++++++++ Running script: $script ++++++++++"
    if [[ $script == *.py ]]; then
        python3 $script
    else 
        sh $script
    fi
    echo "---------- done!!! ----------"
done

popd > /dev/null
