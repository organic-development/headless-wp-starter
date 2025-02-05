#!/usr/bin/env sh

set -e

mysql_ready='nc -z db-headless 3306'

if ! $mysql_ready
then
    printf 'Waiting for MySQL.'
    while ! $mysql_ready
    do
        printf '.'
        sleep 1
    done
    echo
fi

if wp core is-installed
then
    echo "WordPress is already installed, exiting."
    exit
fi

wp core download --force

[ -f wp-config.php ] || wp config create \
    --dbhost="$WORDPRESS_DB_HOST" \
    --dbname="$WORDPRESS_DB_NAME" \
    --dbuser="$WORDPRESS_DB_USER" \
    --dbpass="$WORDPRESS_DB_PASSWORD"

wp core install \
    --url="$WORDPRESS_URL" \
    --title="$WORDPRESS_TITLE" \
    --admin_user="$WORDPRESS_ADMIN_USER" \
    --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
    --admin_email="$WORDPRESS_ADMIN_EMAIL" \
    --skip-email

wp option update blogdescription "$WORDPRESS_DESCRIPTION"
wp rewrite structure "$WORDPRESS_PERMALINK_STRUCTURE"

wp theme activate postlight-headless-wp
wp theme delete twentysixteen twentyseventeen twentynineteen twentytwenty

wp plugin delete akismet hello
wp plugin install --activate --force \
    wordpress-importer \
    wp-rest-api-v2-menus \
    jwt-authentication-for-wp-rest-api \
    oasis-workflow \
    https://github.com/wp-graphql/wp-graphql/archive/v0.3.6.zip \
    https://github.com/wp-graphql/wp-graphql-jwt-authentication/archive/V0.3.2.zip \
    /var/www/plugins/organic-wordpress-framework.zip \
    /var/www/plugins/custom-blocks.zip \
    /var/www/plugins/ultimate-marketo-forms.zip

# Update WP to show page as home page
wp option update show_on_front page

# Update WP to use "Sample Page" as home page
wp option update page_on_front 2

# Copy override files
cp -r /var/www/overrides/* /var/www/html/

echo "Great. You can now log into WordPress at: $WORDPRESS_URL/wp-admin ($WORDPRESS_ADMIN_USER/$WORDPRESS_ADMIN_PASSWORD)"
