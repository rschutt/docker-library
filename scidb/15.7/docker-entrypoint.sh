#!/bin/bash
set -o errexit


service ssh start
service postgresql start


$SCIDB_INSTALL_PATH/bin/scidb.py startall $SCIDB_NAME
/etc/init.d/shimsvc start


if [ "$1" = '' ]
then
    tail -f $SCIDB_INSTALL_PATH/DB-$SCIDB_NAME/000/0/scidb.log
else
    exec "$@"
fi
