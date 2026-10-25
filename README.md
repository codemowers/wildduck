# wildduck

[WildDuck](https://github.com/nodemailer/wildduck) repackaged on a current Node.js base image.

Upstream `nodemailer/wildduck` images are rebuilt rarely, so they lag behind Node.js security
releases. This image copies the upstream application unchanged onto `node:<version>-alpine`.
Renovate keeps both the upstream image digest and the Node.js base up to date.

Images: `ghcr.io/codemowers/wildduck:sha-<commit>` and `:latest`.
