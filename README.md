# Shopwell 6 Production Docker

This repository contains a base image with Alpine + PHP + (Caddy or Nginx), which you can use to build your docker image with your code.

[Documentation can be found here](https://developer.shopwell.cn/docs/guides/hosting/installation-updates/docker.html)

## Container images

Published base images are available from both registries:

- GitHub Container Registry: `ghcr.io/shopwell-shop/docker-base`
- Docker Hub: `shopwell8/docker-base`

For example:

```bash
docker pull ghcr.io/shopwell-shop/docker-base:8.4-caddy
docker pull shopwell8/docker-base:8.4-caddy
```

The GHCR image is shown in the **Packages** section of this GitHub repository after the first successful image publication.
