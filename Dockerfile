# Build WildDuck from the upstream source tag on a patched Node.js base.
# The upstream nodemailer/wildduck:1 image is stuck at 1.45.4 (Jan 2025).
FROM node:22.23.4-alpine AS build
RUN apk --no-cache add git
# renovate: datasource=github-tags depName=nodemailer/wildduck
ARG WILDDUCK_VERSION=v1.46.21
ARG WILDDUCK_COMMIT=b68d3fa2c45b5c31024851ccb8568ab82077fcf6
RUN git clone --depth 1 --branch "$WILDDUCK_VERSION" https://github.com/nodemailer/wildduck.git /wildduck \
    && test "$(git -C /wildduck rev-parse HEAD)" = "$WILDDUCK_COMMIT" \
    && rm -rf /wildduck/.git
WORKDIR /wildduck
RUN npm ci --omit=dev

FROM node:22.23.4-alpine
RUN apk --no-cache add make git dumb-init openssl
WORKDIR /wildduck
COPY --from=build /wildduck /wildduck
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["node", "/wildduck/server.js", "--config=/wildduck/config/default.toml"]
