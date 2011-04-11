#! /bin/sh
BASE_DIR=/tmp/setupserver
cd $BASE_DIR
git pull
$BASE_DIR/base/setup.sh
