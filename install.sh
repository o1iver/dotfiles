#!/usr/bin/env bash

function link_file {
    source="${PWD}/$1"
    target="${HOME}/${1/_/.}"

    if [ -e "${target}" ]; then
        mv $target $target.bak
    fi

    ln -sf ${source} ${target}
}

for i in _*
do
    echo "linking ${i}"
    link_file $i
done

# compile command-t c library
cd _vim/bundle/wincent-Command-T-e9a861b/
rake make
