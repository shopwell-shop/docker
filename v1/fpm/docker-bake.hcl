variable "phpMatrix" {
    default = [ "8.2.35", "8.3.36", "8.4.27", "8.5.12" ]
}

# FPM

target "fpm" {
    inherits = ["_build-secrets"]
    name = "fpm-${replace(substr(php, 0, 3), ".", "-")}"
    context = "./v1/fpm"
    matrix = {
        "php" = phpMatrix
    }
    contexts = {
        base = "docker-image://docker.io/library/php:${php}-fpm-alpine"
    }
    platforms = [ "linux/amd64", "linux/arm64" ]
    tags = imageSuffix != "" ? [
        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${substr(php, 0, 3)}-fpm",
        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${php}-fpm"
    ] : [
        "shopwell8/docker-base${imageSuffix}:${tagPrefix}${substr(php, 0, 3)}-fpm",
        "shopwell8/docker-base${imageSuffix}:${tagPrefix}${php}-fpm",

        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${substr(php, 0, 3)}-fpm",
        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${php}-fpm"
    ]
}

target "fpm-otel" {
    inherits = ["_build-secrets"]
    name = "fpm-otel-${replace(substr(php, 0, 3), ".", "-")}"
    context = "./v1/fpm/otel"
    matrix = {
        "php" = phpMatrix
    }
    contexts = {
        base = "docker-image://ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${php}-fpm"
    }
    platforms = [ "linux/amd64", "linux/arm64" ]
    tags = imageSuffix != "" ? [
        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${substr(php, 0, 3)}-fpm-otel",
        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${php}-fpm-otel"
    ] : [
        "shopwell8/docker-base${imageSuffix}:${tagPrefix}${substr(php, 0, 3)}-fpm-otel",
        "shopwell8/docker-base${imageSuffix}:${tagPrefix}${php}-fpm-otel",

        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${substr(php, 0, 3)}-fpm-otel",
        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${php}-fpm-otel"
    ]
}

# Caddy

target "caddy" {
    inherits = ["_build-secrets"]
    name = "caddy-${replace(substr(php, 0, 3), ".", "-")}"
    context = "./v1/fpm/caddy"
    matrix = {
        "php" = phpMatrix
    }
    contexts = {
        base = "docker-image://ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${php}-fpm"
    }
    platforms = [ "linux/amd64", "linux/arm64" ]
    tags = imageSuffix != "" ? [
        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${substr(php, 0, 3)}-caddy",
        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${php}-caddy"
    ] : [
        "shopwell8/docker-base${imageSuffix}:${tagPrefix}${substr(php, 0, 3)}-caddy",
        "shopwell8/docker-base${imageSuffix}:${tagPrefix}${php}-caddy",

        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${substr(php, 0, 3)}-caddy",
        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${php}-caddy"
    ]
}

target "caddy-otel" {
    inherits = ["_build-secrets"]
    name = "caddy-otel-${replace(substr(php, 0, 3), ".", "-")}"
    context = "./v1/fpm/caddy"
    matrix = {
        "php" = phpMatrix
    }
    contexts = {
        base = "docker-image://ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${php}-fpm-otel"
    }
    platforms = [ "linux/amd64", "linux/arm64" ]
    tags = imageSuffix != "" ? [
        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${substr(php, 0, 3)}-caddy-otel",
        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${php}-caddy-otel"
    ] : [
        "shopwell8/docker-base${imageSuffix}:${tagPrefix}${substr(php, 0, 3)}-caddy-otel",
        "shopwell8/docker-base${imageSuffix}:${tagPrefix}${php}-caddy-otel",

        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${substr(php, 0, 3)}-caddy-otel",
        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${php}-caddy-otel"
    ]
}

target "caddy-dev" {
    inherits = ["_build-secrets"]
    name = "caddy-dev-${replace(substr(php, 0, 3), ".", "-")}-${node}"
    context = "./v1/fpm/dev"
    matrix = {
        "php"  = phpMatrix
        "node" = [ "22", "24" ]
    }
    contexts = {
        base = "docker-image://ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${php}-caddy-otel"
    }
    args = {
        "NODE_VERSION" = node
    }
    platforms = [ "linux/amd64", "linux/arm64" ]
    tags = [
        "ghcr.io/shopwell-shop/docker-dev${imageSuffix}:${tagPrefix}php${substr(php, 0, 3)}-node${node}-caddy",
        "ghcr.io/shopwell-shop/docker-dev${imageSuffix}:${tagPrefix}php${php}-node${node}-caddy"
    ]
}

# Nginx

target "nginx" {
    inherits = ["_build-secrets"]
    name = "nginx-${replace(substr(php, 0, 3), ".", "-")}"
    context = "./v1/fpm/nginx"
    matrix = {
        "php" = phpMatrix
    }
    contexts = {
        base = "docker-image://ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${php}-fpm"
    }
    platforms = [ "linux/amd64", "linux/arm64" ]
    tags = imageSuffix != "" ? [
        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${substr(php, 0, 3)}-nginx",
        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${php}-nginx"
    ] : [
        "shopwell8/docker-base${imageSuffix}:${tagPrefix}${substr(php, 0, 3)}-nginx",
        "shopwell8/docker-base${imageSuffix}:${tagPrefix}${php}-nginx",

        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${substr(php, 0, 3)}-nginx",
        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${php}-nginx"
    ]
}

target "nginx-otel" {
    inherits = ["_build-secrets"]
    name = "nginx-otel-${replace(substr(php, 0, 3), ".", "-")}"
    context = "./v1/fpm/nginx"
    matrix = {
        "php" = phpMatrix
    }
    contexts = {
        base = "docker-image://ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${php}-fpm-otel"
    }
    platforms = [ "linux/amd64", "linux/arm64" ]
    tags = imageSuffix != "" ? [
        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${substr(php, 0, 3)}-nginx-otel",
        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${php}-nginx-otel"
    ] : [
        "shopwell8/docker-base${imageSuffix}:${tagPrefix}${substr(php, 0, 3)}-nginx-otel",
        "shopwell8/docker-base${imageSuffix}:${tagPrefix}${php}-nginx-otel",

        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${substr(php, 0, 3)}-nginx-otel",
        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${php}-nginx-otel"
    ]
}

target "nginx-dev" {
    inherits = ["_build-secrets"]
    name = "nginx-dev-${replace(substr(php, 0, 3), ".", "-")}-${node}"
    context = "./v1/fpm/dev"
    matrix = {
        "php"  = phpMatrix
        "node" = [ "22", "24" ]
    }
    contexts = {
        base = "docker-image://ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${php}-nginx-otel"
    }
    args = {
        "NODE_VERSION" = node
    }
    platforms = [ "linux/amd64", "linux/arm64" ]
    tags = [
        "ghcr.io/shopwell-shop/docker-dev${imageSuffix}:${tagPrefix}php${substr(php, 0, 3)}-node${node}-nginx",
        "ghcr.io/shopwell-shop/docker-dev${imageSuffix}:${tagPrefix}php${php}-node${node}-nginx"
    ]
}
