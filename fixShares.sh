#!/bin/bash

###
## parse config 
#

if [ -e btsync.conf ]
then
    source btsync.conf
else {
    echo "no config file found"
    echo "see the readme"
    exit 1
    }
fi

#echo "sourced config:"
#echo $syncList

###
## functions
#

correctOwners() {
    chown -R $btOwner:$btGroup "$1"
}

correctPerms() {
    chmod -R 2775 "$1"
}

###
## work
#

for each in $syncList
do
    #echo $each
    correctOwners $each
    correctPerms $each
done