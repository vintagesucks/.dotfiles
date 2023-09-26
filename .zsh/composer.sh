function composer-bump {
    valet composer require "$1" -W
    valet composer bump
    valet composer validate || true
}

function composer-set {
    valet composer require "$1"
    valet composer require $(echo $1 | cut -d: -f1):^$(echo $1 | cut -d: -f2) --no-update
    valet composer update --lock
    valet composer validate || true
}

function composer-set-w {
    valet composer require "$1"
    valet composer require $(echo $1 | cut -d: -f1):^$(echo $1 | cut -d: -f2) --no-update
    valet composer update --lock
    valet composer validate || true
}

function composer-set-phar {
    COMPOSER_MEMORY_LIMIT=-1 valet php ./composer.phar require "$1"
    COMPOSER_MEMORY_LIMIT=-1 valet php ./composer.phar require $(echo $1 | cut -d: -f1):^$(echo $1 | cut -d: -f2) --no-update
    COMPOSER_MEMORY_LIMIT=-1 valet php ./composer.phar update --lock
    COMPOSER_MEMORY_LIMIT=-1 valet php ./composer.phar validate || true
}

function composer-set-indirect {
    valet composer require "$1"
    valet composer require $(echo $1 | cut -d: -f1):^$(echo $1 | cut -d: -f2) --no-update
    valet composer update --lock
    valet composer remove $(echo $1 | cut -d: -f1) --no-update
    valet composer update --lock
    valet composer validate || true
}

function composer-set-indirect-phar {
    COMPOSER_MEMORY_LIMIT=-1 valet php ./composer.phar require "$1"
    COMPOSER_MEMORY_LIMIT=-1 valet php ./composer.phar require $(echo $1 | cut -d: -f1):^$(echo $1 | cut -d: -f2) --no-update
    COMPOSER_MEMORY_LIMIT=-1 valet php ./composer.phar update --lock
    COMPOSER_MEMORY_LIMIT=-1 valet php ./composer.phar remove $(echo $1 | cut -d: -f1) --no-update
    COMPOSER_MEMORY_LIMIT=-1 valet php ./composer.phar update --lock
    COMPOSER_MEMORY_LIMIT=-1 valet php ./composer.phar validate || true
}

function composer-bump-indirect {
    valet composer require "$1"
    valet composer remove $(echo $1 | cut -d: -f1) --no-update
    valet composer update --lock
    valet composer validate || true
}
