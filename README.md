# Docker Static App Deployment
This is a local deployment to serve the Github Pages app of [zaefe.github.io/client-side-demos/](https://zaefe.github.io/client-side-demos/)

## Architecture

- Requests to `http://localhost:8081` get routed to the `fp-svc` which has a webserver on port `7901`
    - For `http://fp-svc:7901/`, the container proxies to `http://hp-svc:6969/`
    - For `http://fp-svc:7901/client-side-demos`, the container serves the pages site stored inside the image at `/usr/share/nginx/html` (this came from a Git repo)
    - The `hp-svc` serves a landing page on port `6969` that comes from a volume and has a link to `http://localhost:8081/client-side-demos/`


## Prerequisites

- Docker version (27.4.0, build bde2b89)+
- sh shell with typical tools and perl

## Testing Notes

- Tested on Windows 11 Home
- Tested with Docker version 27.4.0, build bde2b89
- Tested with Git Bash

## Usage
1. Initialize the file structure and volumes.
    ```bash
    chmod +x scripts/init.sh;
    ./scripts/init.sh;
    ```
2. To up the compose stack:
    ```bash
    docker compose up -d
    ```
3. Visit the homepage by going to [http://localhost:8081](http://localhost:8081) in the browser.
4. Click the link you find on the homepage
5. To monitor services, attach to the watchdog and curl different services.
    ```bash
    docker compose attach watchdog-svc;
    ```
    (from inside watchdog-c)
    ```bash
    apk add curl;
    curl http://fp-svc:7901; # proxied to http://hp-svc:6969/
    curl http://hp-svc:6969; # hits http://hp-svc:6969/
    curl http://fp-svc:7901/client-side-demos/ # hit the pages site
    ```
    Use `ctrl-d` to exit and restart the main shell process

6. To down the compose stack:
    ```bash
    docker compose down;
    ```
