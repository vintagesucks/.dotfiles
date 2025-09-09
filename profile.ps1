# php
$env:COMPOSER_IGNORE_PLATFORM_REQ = "ext-pcntl,ext-posix"
function takeout { docker run --rm -v //var/run/docker.sock:/var/run/docker.sock -it tighten/takeout:latest $args }
function valet { herd @Args }

# docker
function jammy { docker run -it --rm --platform linux/amd64 ubuntu:jammy }
function noble { docker run -it --rm --platform linux/amd64 ubuntu:noble }

# claude code
$env:CLAUDE_CODE_GIT_BASH_PATH = "$env:USERPROFILE\scoop\shims\bash.exe"
