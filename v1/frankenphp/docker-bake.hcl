variable "frankenphpMatrix" {
    default = [ "8.2.35", "8.3.36", "8.4.27", "8.5.12" ]
}

# Frankenphp

target "frankenphp" {
    inherits = ["_build-secrets"]
    name = "frankenphp-${replace(substr(php, 0, 3), ".", "-")}"
    context = "./v1/frankenphp"
    matrix = {
        "php" = frankenphpMatrix
    }
    args = {
        "PHP_VERSION" = php
    }
    platforms = [ "linux/amd64", "linux/arm64" ]
    tags = imageSuffix != "" ? [
        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${substr(php, 0, 3)}-frankenphp",
        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${php}-frankenphp"
    ] : [
        "shopwell8/docker-base${imageSuffix}:${tagPrefix}${substr(php, 0, 3)}-frankenphp",
        "shopwell8/docker-base${imageSuffix}:${tagPrefix}${php}-frankenphp",

        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${substr(php, 0, 3)}-frankenphp",
        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${php}-frankenphp"
    ]
}

target "frankenphp-otel" {
    inherits = ["_build-secrets"]
    name = "frankenphp-otel-${replace(substr(php, 0, 3), ".", "-")}"
    context = "./v1/frankenphp/otel"
    matrix = {
        "php" = frankenphpMatrix
    }
    contexts = {
        base = "docker-image://ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${php}-frankenphp"
    }
    platforms = [ "linux/amd64", "linux/arm64" ]
    tags = imageSuffix != "" ? [
        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${substr(php, 0, 3)}-frankenphp-otel",
        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${php}-frankenphp-otel"
    ] : [
        "shopwell8/docker-base${imageSuffix}:${tagPrefix}${substr(php, 0, 3)}-frankenphp-otel",
        "shopwell8/docker-base${imageSuffix}:${tagPrefix}${php}-frankenphp-otel",

        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${substr(php, 0, 3)}-frankenphp-otel",
        "ghcr.io/shopwell-shop/docker-base${imageSuffix}:${tagPrefix}${php}-frankenphp-otel"
    ]
}
