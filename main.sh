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

node -v || echo "Need node installed. Consider https://github.com/creationix/nvm" 

echo "##### Installing Wintersmith...."

npm install -g wintersmith

echo "##### Installing Coffeescript..."
npm install -g coffee-script
npm update

echo "##### Patching weird bug in wintersmith-stylus...."
pushd $us/node_modules/wintersmith-stylus
coffee -c plugin.coffee 
popd 

echo "##### Starting wintersmith built-in webserver..."
wintersmith preview
