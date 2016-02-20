[![logo](https://raw.githubusercontent.com/dperson/transmission/master/logo.png)](https://www.transmissionbt.com/)

# Transmission

Transmission docker container

# What is Transmission?

Transmission is a BitTorrent client which features a simple interface on top of
a cross-platform back-end.

# How to use this image

    sudo docker run -it --name bit -d mlamp/transmission

**NOTE**: The default username/password are `admin`/`admin`. See `TRUSER` and
`TRGROUP` below, for how to change them.

## Hosting a Transmission instance

    sudo docker run --name transmission -p 9091:9091 -d mlamp/transmission

OR set local storage:

    sudo docker run -d --restart always --name transmission -p 9091:9091 \
                -v /path/to/directory:/var/lib/transmission-daemon/downloads \
                -d mlamp/transmission

**NOTE**: The configuration is in `/var/lib/transmission-daemon/info`, downloads
are in `/var/lib/transmission-daemon/downloads`, and partial downloads are in
`/var/lib/transmission-daemon/incomplete`.

## Configuration

    sudo docker run -it --rm mlamp/transmission -h

    Usage: transmission.sh [-opt] [command]
    Options (fields in '[]' are optional, '<>' are required):
        -h          This help
        -t ""       Configure timezone
                    possible arg: "[timezone]" - zoneinfo timezone for container

    The 'command' (if provided and valid) will be run instead of transmission

ENVIRONMENT VARIABLES (only available with `docker run`)

 * `TRUSER` - Set the username for transmission auth (default 'admin')
 * `TRPASSWD` - Set the password for transmission auth (default 'admin')
 * `TZ` - As above, configure the zoneinfo timezone, IE `EST5EDT`
 * `USERID` - Set the UID for the app user
 * `GROUPID` - Set the GID for the app user

Other environment variables beginning with `TR_` will edit the configuration
file accordingly:

 * `TR_MAX_PEERS_GLOBAL=400` will translate to `"max-peers-global": 400,`

## Examples

Any of the commands can be run at creation with `docker run` or later with
`docker exec -it transmission.sh` (as of version 1.3 of docker).

### Setting the Timezone

    sudo docker run -d --name transmission mlamp/transmission -t EST5EDT

OR using `environment variables`

    sudo docker run -d --name transmission -e TZ=EST5EDT mlamp/transmission

Will get you the same settings as

    sudo docker run -d --name transmission -p 9091:9091 mlamp/transmission
    sudo docker exec -it transmission transmission.sh -t EST5EDT \
                ls -AlF /etc/localtime
    sudo docker restart transmission

# User Feedback

## Issues

If you have any problems with or questions about this image, please contact me
through a [GitHub issue](https://github.com/mlamp/docker-transmission/issues).
