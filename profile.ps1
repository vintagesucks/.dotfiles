$env:COMPOSER_IGNORE_PLATFORM_REQ = "ext-pcntl,ext-posix"

function takeout {
    docker run --rm -v //var/run/docker.sock:/var/run/docker.sock -it tighten/takeout:latest $args
}

function valet {
    herd @Args
}
