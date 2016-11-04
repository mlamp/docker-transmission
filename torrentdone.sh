#!/bin/bash 

##########
/usr/local/bin/unrarall "$TR_TORRENT_DIR/$TR_TORRENT_NAME"
if [ $? -eq 0 ]
then
  find "$TR_TORRENT_DIR/$TR_TORRENT_NAME" -exec touch {} +
fi
