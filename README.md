# wildduck

[WildDuck](https://github.com/nodemailer/wildduck) built from an upstream source tag on a current
Node.js base image.

Upstream `nodemailer/wildduck` images are rebuilt rarely, so they lag behind both WildDuck releases
and Node.js security releases. This image clones the pinned upstream tag (verified against its commit),
installs production dependencies from the lockfile and runs it on `node:<version>-alpine`.
Renovate keeps both the WildDuck tag/commit and the Node.js base up to date.

Images: `ghcr.io/codemowers/wildduck:sha-<commit>` and `:latest`.
