# Docker Static App Deployment


This is a local deployment to serve run server-side PHP scripts integrated with an NGINX webserver.


## Architecture

- An NGINX container serves HTTP traffic on port 8080 and uses a PHP-FPM container to run the PHP scripts.


## Prerequisites

- Docker version (27.4.0, build bde2b89)+
- sh shell with typical tools

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
3. To up the compose stack:
    ```bash
    docker compose up -d
    ```
4. To down the compose stack:
    ```bash
    docker compose down;
    ```
