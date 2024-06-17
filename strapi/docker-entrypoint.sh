#!/bin/sh


# Check if the app folder is empty
if [ -z "$(ls -A /opt/app)" ]; then
  # Create Strapi project with database configuration from environment variables
  npx create-strapi-app@latest . \
    --skip-cloud \
    --no-run \
    --ts \
    --use-npm \
    --dbclient=${DATABASE_CLIENT} \
    --dbhost=${DATABASE_HOST} \
    --dbport=${DATABASE_PORT} \
    --dbname=${DATABASE_NAME} \
    --dbusername=${DATABASE_USERNAME} \
    --dbpassword=${DATABASE_PASSWORD}
fi

# Build Strapi project
npm run build

# Execute the passed command
exec "$@"
