# Headless Wordpress with React Frontend

Forked from [Postlight's Headless WP Starter](https://github.com/postlight/headless-wp-starter) with original frontend(s) intact. Additional frontend option added to allow the use of [Gatsby](https://gatsbyjs.org)

This readme only contains additional notes and setup instructions / issues. To read more about how this is set up, please read the original documentation first: [https://github.com/postlight/headless-wp-starter](https://github.com/postlight/headless-wp-starter)

The following will just get the Gatsby frontend & Wordpress backend running:

## Installation

Before you begin, you need [Docker](https://www.docker.com) installed. On Linux, you might need to install [docker-compose](https://docs.docker.com/compose/install/#install-compose) separately.

Start the Wordpress containers:

```bash
yarn start:backend
```

Note: The first time I built the containers, `wp-headless` failed to build. Had to use this command to start:

```bash
docker-compose up --build --force-recreate wp-headless
```