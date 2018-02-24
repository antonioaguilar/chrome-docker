# Chrome headless container

Docker container running headless Chrome with VNC support

### Usage

```bash
docker run -it --rm -p 22000:5901 aaguilar/chrome https://www.google.com
```

### VNC access

The default VNC password is `password`, this can be configured directly in the VNC command:

```bash
# this works in Mac OS only
open vnc:password@localhost:22000
```

### Lauch multiple browsers

```bash
#!/bin/bash

command -v docker >/dev/null 2>&1 || { echo "docker command not installed" >&2; exit 1; }

if [ $# -eq 0 ]; then echo "No URL provided"; exit 1; fi

URL=$1
PORT=22000

for((index=1; index <= 5; index++)) do

  BROWSER_ID="chrome-$index"
  PORT=$(($PORT + 1));

  docker run -it -d --rm \
  --name=$BROWSER_ID \
  -m 128M \
  -p $PORT:5901 \
  aaguilar/chrome $URL

done
``` 

```bash
#!/bin/bash

# runs in Mac OS only
PORT=22000

for((index=1; index <= 5; index++)) do
  PORT=$(($PORT + 1));
  open vnc:password@localhost:$PORT
done

```
