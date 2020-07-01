#!/bin/bash
################################################################################
#
# Scrip Created by http://CryptoLions.io
# For EOS mainnet
# & Updated by Charles Holtzkampf
# https://github.com/ankh2054/EOS-MainNet
#
###############################################################################

DIR="/chains/wax"


 if [ -f $DIR"/nodeos.pid" ]; then
        pid=`cat $DIR"/nodeos.pid"`
        echo $pid
        kill $pid


        echo -ne "Stoping Nodeos"

        while true; do
            [ ! -d "/proc/$pid/fd" ] && break
            echo -ne "."
            sleep 1
        done
        rm -r $DIR"/nodeos.pid"

        DATE=$(date -d "now" +'%Y_%m_%d-%H_%M')
        if [ ! -d $DIR/logs ]; then
            mkdir $DIR/logs
        fi
        tar -pcvzf $DIR/logs/stderr-$DATE.txt.tar.gz  $DIR/stderr.txt $DIR/stdout.txt &>/dev/null


        echo -ne "\rNodeos Stopped.    \n"
    fi
