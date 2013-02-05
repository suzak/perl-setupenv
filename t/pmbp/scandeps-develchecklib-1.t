#!/bin/sh
echo "1..1"
basedir=`dirname $0`/../..
pmbp=$basedir/bin/pmbp.pl
tempdir=`perl -MFile::Temp=tempdir -e 'print tempdir'`/testapp
json=`echo $tempdir/deps/pmtar/deps/Devel-CheckLib-*.json`

perl $pmbp --root-dir-name="$tempdir" \
    --select-module=Devel::CheckLib \
    --write-libs-txt="$tempdir/libs.txt" \
    --write-module-index="$tempdir/index.txt"

(grep "Devel::CheckLib " "$tempdir/index.txt" > /dev/null && echo "ok 1") || echo "not ok 1"

rm -fr $tempdir
