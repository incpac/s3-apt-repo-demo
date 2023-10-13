#!/bin/bash

echo "================================================"
echo "Reading Config:"
echo ""


packageString=`grep Package helloworld/DEBIAN/control`
read -a package <<< $packageString

versionString=`grep Version helloworld/DEBIAN/control`
read -a version <<< $versionString

architectureString=`grep Architecture helloworld/DEBIAN/control`
read -a architecture <<< $architectureString

build_name="${package[1]}_${version[1]}_${architecture[1]}"
echo "Build Name: $build_name"

echo ""
echo "================================================"
echo "Build Package:"
echo ""
cp -rv helloworld $build_name

chmod +x $build_name/usr/local/bin/helloworld

dpkg --build $build_name  || exit 1

