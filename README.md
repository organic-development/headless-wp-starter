# Headless Wordpress with React Frontend

Forked from [Postlight's Headless WP Starter](https://github.com/postlight/headless-wp-starter) with original frontend(s) intact. Additional frontend option added to allow the use of [Gatsby](https://gatsbyjs.org)

This readme only contains additional notes and setup instructions / issues. To read more about how this is set up, please read the original documentation first: [https://github.com/postlight/headless-wp-starter](https://github.com/postlight/headless-wp-starter)

The following will just get the Gatsby frontend & Wordpress backend running:

## Installation

Before you begin, you need [Docker](https://www.docker.com) installed. On Linux, you might need to install [docker-compose](https://docs.docker.com/compose/install/#install-compose) separately.

Install the packges:

```bash
cd frontend-gatsby
yarn install
```

## Development

If you are using [iTerm](https://iterm2.com/), you can install [itermocil](https://github.com/TomAnthony/itermocil) and run the `itermocil` command. This will open a split iTerm window, and start the services.

Without iTerm, do the following:

Start the Wordpress containers:

```bash
yarn start:wordpress
```

The Wordpress install will be running on http://localhost:8080.
[Wordpress admin](http://localhost:8080) credentials are: `postlight:postlight`

*Note: The first time I built the containers, `wp-headless` failed to build. Had to use this command to start:*

```bash
docker-compose up --build --force-recreate wp-headless
```

Start the Gatsby server:

```bash
yarn start:gatsby
```

The frontend will be running on http://localhost:8000

## Overrides

The `docker/overrides` folder can be used to update any files in the Wordpress installation.

## Known Issues / Outstanding Tasks

- `isFrontPage` attribute not found in `./src/templates/page/data.js` (Requires wp-graphql >= v0.4.1, which creates [this issue](https://github.com/postlight/headless-wp-starter/issues/243))
- Set page as frontpage, rather than posts
- Remove test posts
- Remove unused plugins
- Frontend deployment to App Engine
- Backend deployment to Compute Engine