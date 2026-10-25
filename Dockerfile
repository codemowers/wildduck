# Upstream nodemailer/wildduck:1 ships Node 22.13.0 and hasn't been rebuilt since
# Feb 2025. Re-home the app on a patched Node (CVE-2026-111497, Node2Shell).
FROM nodemailer/wildduck:1@sha256:7f580d4b5a18cabf8b28f4bd791d5c1c16f278a83f05b99357064c50b7bfb6d5 AS upstream

FROM node:22.23.4-alpine
RUN apk --no-cache add make git dumb-init openssl
WORKDIR /wildduck
COPY --from=upstream /wildduck /wildduck
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["node", "/wildduck/server.js", "--config=/wildduck/config/default.toml"]
