#!/bin/bash
#stage: /url/stage.domen.ru

working_direktori=$(pwd)
echo $working_direktori
ls -la

if ! [ -d ./dist/ ];
    then
        echo '\033[0m\n\033[0m\033[31m--------\n ERROR: No directory "dist"\n--------'
        exit 1
fi

sudo rsync   --progress --delete --stats -vcr  ./dist/* /url/stage.domen.ru

sudo chown -R /url/stage.domen.ru

echo "Copying complete"

