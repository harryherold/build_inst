#!/usr/bin/bash

set -e

builds_path=$PWD/builds
build_steps=

prepare_build()
{
    return
}

configure_build()
{
    return
}

make_build()
{
    make -j5
}

install_build()
{
    make install
}

load_build()
{
    build=$1
    . $build
    build_steps=(prepare_build configure_build make_build install_build)
}

if [ "$#" -eq 0 ]; then
    builds=$(ls  $builds_path/*.blt.sh)
else
    for b in "$@"
    do
        if [ -f "$builds_path/$b.blt.sh" ]; then
        builds="$builds $builds_path/$b.blt.sh"
        fi
    done
fi

for build in $builds
do
    (
        load_build $build
        for step in "${build_steps[@]}"
        do
            $step
        done
    )
done
