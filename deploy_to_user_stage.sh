#!/bin/bash/
######################
#
# $1 - awaits username
#
######################
#
#   Check user and choose target domain
#
######################
if ! [ -n "$1" ]
then
    echo "\t\033[31m--------\033[0m\n"
    echo "\t\033[41mERROR:\033[0m\n"
        echo "\tNo username found!"
        echo "\t\033[31m--------\033[0m\n"
        echo "Cancel operation"
        exit 1
fi

username=$1
targetDomain="undefined"

case $username in
"AlekseidDEV")
    targetDomain="Домен выделенный под разраба"
    ;;
"skiboorg")
    targetDomain="Домен выделенный под разраба"
    ;;
 *)
   echo "\t\033[31m--------\033[0m\n"
   echo "\t\033[41mERROR:\033[0m\n"
   echo "\tThe target domain could not be determined for user \033[31m$username\033[0m.\n"
   echo "\t\033[31m--------\033[0m\n"
   echo "Cancel operation"
   exit 1
    ;;
esac

######################
#
#   Deploy to target domain
#
######################
if ! [ -d ./dist/ ];
    then
        echo '\033[0m\n\033[0m\033[31m--------\n ERROR: No directory "dist"\n--------'
        echo "\033[0m"
        exit 1
fi

sudo rsync   --progress --delete --stats -vcr  ./dist/* /url/$targetDomain

echo "Copying complete"

sudo chown -R /url/$targetDomain

echo "\nUser domain for testing is:"
echo "\033[33m"
echo "\thttps://$targetDomain/"
echo "\033[0m"
