#!/bin/bash

if [[ ! -f $SYNCTHING_CONFIG ]]; then
  syncthing -generate=$SYNCTHING_HOME

  if [[ -n "$ST_GUI_TLS" ]]; then
    sed -i "s,tls=\"false\",tls=\"$ST_GUI_TLS\"," $SYNCTHING_CONFIG
  fi

  if [[ -n "$ST_GUI_ADDRESS" ]]; then
    sed -i "s,<address>127.0.0.1:8384</address>,<address>$ST_GUI_ADDRESS</address>," $SYNCTHING_CONFIG
  fi

  if [[ -n "$ST_LISTEN_ADDRESS" ]]; then
    sed -i "s,<listenAddress>default</listenAddress>,<listenAddress>$ST_LISTEN_ADDRESS</listenAddress>," $SYNCTHING_CONFIG
  fi

  if [[ -n "$ST_GLOBAL_ANNOUNCE_SERVER" ]]; then
    sed -i "s,<globalAnnounceServer>default</globalAnnounceServer>,<globalAnnounceServer>$ST_GLOBAL_ANNOUNCE_SERVER</globalAnnounceServer>," $SYNCTHING_CONFIG
  fi

  if [[ -n "$ST_GLOBAL_ANNOUNCE_ENABLED" ]]; then
    sed -i "s,<globalAnnounceEnabled>true</globalAnnounceEnabled>,<globalAnnounceEnabled>$ST_GLOBAL_ANNOUNCE_ENABLED</globalAnnounceEnabled>," $SYNCTHING_CONFIG
  fi

  if [[ -n "$ST_LOCAL_ANNOUNCE_ENABLED" ]]; then
    sed -i "s,<localAnnounceEnabled>true</localAnnounceEnabled>,<localAnnounceEnabled>$ST_LOCAL_ANNOUNCE_ENABLED</localAnnounceEnabled>," $SYNCTHING_CONFIG
  fi

  if [[ -n "$ST_RELAYS_ENABLED" ]]; then
    sed -i "s,<relaysEnabled>true</relaysEnabled>,<relaysEnabled>$ST_RELAYS_ENABLED</relaysEnabled>," $SYNCTHING_CONFIG
  fi

  if [[ -n "$ST_START_BROWSER" ]]; then
    sed -i "s,<startBrowser>true</startBrowser>,<startBrowser>$ST_START_BROWSER</startBrowser>," $SYNCTHING_CONFIG
  fi

  if [[ -n "$ST_UR_ACCEPTED" ]]; then
    sed -i "s,<urAccepted>0</urAccepted>,<urAccepted>$ST_UR_ACCEPTED</urAccepted>," $SYNCTHING_CONFIG
  fi

  if [[ -n "$ST_AUTO_UPGRADE_INTERVAL_H" ]]; then
    sed -i "s,<autoUpgradeIntervalH>12</autoUpgradeIntervalH>,<autoUpgradeIntervalH>$ST_AUTO_UPGRADE_INTERVAL_H</autoUpgradeIntervalH>," $SYNCTHING_CONFIG
  fi

  if [[ -n "$ST_RELEASES_URL" ]]; then
    sed -i "s,<releasesURL>https://upgrades.syncthing.net/meta.json</releasesURL>,<releasesURL>$ST_RELEASES_URL</releasesURL>," $SYNCTHING_CONFIG
  fi
fi

syncthing -home=$SYNCTHING_HOME
