#!/bin/bash

[ -z "$1" ] && echo "Usage : $0 4.42"

VERSION=$1

mkdir $VERSION
echo "ARG PHPLOY_VERSION=$VERSION
FROM pockost/phploy:onbuild" > $VERSION/Dockerfile

ln -sf $VERSION latest


echo "Note : Update Readme before commit and triger build on docker hub"

