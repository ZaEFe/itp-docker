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
3. Down the compose stack:
    ```bash
    docker compose down
    ```
