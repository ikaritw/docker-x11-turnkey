#!/bin/bash
#EINVTURNKEY_PATH="/EINVTurnkey"
#EINVTURNKEY_URL="https://www.einvoice.nat.gov.tw/APTRNKY/index.html"

if [ -d "$EINVTURNKEY_PATH" ]; then
  
  cd $EINVTURNKEY_PATH/linux

  if [ ! -f /inited ]; then
    echo "EINVTurnkey runFirst!!"
    ./runFirst.sct
    touch /inited
  fi

  if [ -f /inited ]; then
    echo "EINVTurnkey einvTurnkey!!"
    ./einvTurnkey.sct
    tail -f /dev/null
  fi

else
  /usr/bin/midori $EINVTURNKEY_URL
fi
