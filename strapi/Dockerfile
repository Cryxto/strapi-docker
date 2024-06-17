FROM node:18-alpine

ENV PS1="\u@\h:\w\\$ "
ENV TZ="Asia/Jakarta"

# Install necessary packages
RUN apk update && apk add --no-cache \
  build-base \
  gcc \
  autoconf \
  automake \
  zlib-dev \
  libpng-dev \
  nasm \
  bash \
  vips-dev \
  git

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

# Copy the entrypoint script
COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Set working directory
WORKDIR /opt/app

# Set entrypoint
ENTRYPOINT ["docker-entrypoint.sh"]

# Expose the port
EXPOSE 1337

# Default command
CMD ["npm", "run", "start"]
