#!/bin/bash -e

if [[ -z $1 ]]; then
    echo "usage: $0 <tag-name>"
    exit 1
fi

d=$(pwd)
project=$(basename "$d")
project=${project%.git}

tag=$1
version=$tag
version=${version#$project} # strip project name
version=${version#v}        # strip 'v' from "v1.2.3"

tarball_name=$project-$version.tar.gz
echo "building '${tarball_name}' out of tag '${tag}'"

git archive --format=tar "$tag" --prefix="$project-$version/" | gzip > "$tarball_name"
