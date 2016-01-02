#!/bin/sh
set -e
cd doc
haxe build_doc.hxml || { cd ..; echo "build_doc failed"; exit 1; }
cd ..
rm -f electron.zip
zip -r electron.zip src doc/ImportCore.hx test extraParams.hxml haxelib.json LICENSE README.md -x "*/\.*"
haxelib submit electron.zip
