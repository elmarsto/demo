#!/bin/bash - 
#===============================================================================
#
#          FILE: builder.sh
# 
#         USAGE: ./builder.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (),
#  ORGANIZATION:
#       CREATED: 18/10/13 17:29:31 PDT
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


us=`pwd`
user=demo
password=nieH3zai
server=localhost
protocol=http
port=5984
database=demo
document=demo
dest=$protocol://$user:$password@$server:$port/$database/
ink=$us/stack/Ink/


cd $ink
make
cd -
us=`pwd`
b=$us/build/$document
pushd $us
git commit -am 'autocommit'
wintersmith build
rsync -av {.couchapprc,_ddoc,app.*} $b/
pushd $b
erica push -f --is-ddoc $dest
popd
popd
../google_appengine/appcfg.py update build/undoware --oauth2

