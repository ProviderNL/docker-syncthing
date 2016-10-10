#!/bin/bash

if [[ ! -f $SYNCTHING_CONFIG ]]; then
  syncthing -generate=$SYNCTHING_HOME

  # Enable SSL for the GUI
  sed -i 's/tls="false"/tls="true"/' $SYNCTHING_CONFIG
fi

syncthing -home=$SYNCTHING_HOME
