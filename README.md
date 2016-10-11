# docker-syncthing

Example startup with persistent storage on /home/syncthing, mounted from
the host folder /var/lib/syncthing:

```
export SYNCTHING_USER="host-user"
export SYNCTHING_GROUP="host-group"
export SYNCTHING_DIR="/var/lib/syncthing"
sudo mkdir "${SYNCTHING_DIR}"
sudo chown "${SYNCTHING_USER}":"${SYNCTHING_GROUP}" "${SYNCTHING_DIR}"

sudo docker run \
  --name=syncthing \
  --user=$(id -u ${SYNCTHING_USER}):$(id -u ${SYNCTHING_GROUP}) \
  --detach=true \
  --restart=always \
  --volume="${SYNCTHING_DIR}":"/home/syncthing" \
  --volume=/data:/data \
  --expose=8384 \
  --expose=22000 \
  --publish=8384:8384 \
  --publish=22000:22000 \
  providernl/syncthing
```

## Configuration

The container will generate /home/syncthing/.config/syncthing/config.xml for you
when you run it the first time, but only if it does not yet exist. You can
configure what gets written to the XML using the following environment options.
Specify configuration options as parameters to `docker run`, as follows:

```
--env='STCFG_OPTION=value'
```

Full configuration reference: https://docs.syncthing.net/users/config.html

| Option                                        | Values                       | Default value         |
|-----------------------------------------------|------------------------------|-----------------------|
| ST_GUI_TLS                                    | boolean                      | false                 |
| ST_GUI_ADDRESS                                | ip:port                      | 127.0.0.1:8384        |
| ST_GLOBAL_ANNOUNCE_SERVER                     | HTTP(S) url, or default      | default               |
| ST_GLOBAL_ANNOUNCE_ENABLED                    | boolean                      | true                  |
| ST_LOCAL_ANNOUNCE_ENABLED                     | boolean                      | true                  |
| ST_RELAYS_ENABLED                             | boolean                      | true                  |
| ST_START_BROWSER                              | boolean                      | true                  |
| ST_UR_ACCEPTED                                | -1, 0 or 1                   | 0                     |
| ST_AUTO_UPGRADE_INTERVAL_H                    | integer                      | 12                    |


## Troubleshooting

- In the past there have been issues grabbing the tarball package from GitHub
during the build process. If your build fails, there may be a hiccup at GitHub.
