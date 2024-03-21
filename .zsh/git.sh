function shortlog {
    git shortlog --summary --numbered --email
}

function release {
    if ! $(git config --get push.followTags); then
        echo 'Please enable push.followTags in the current repository:';
        echo '';
        echo '  git config push.followTags true';

        return 1;
    fi

    git checkout -b release/$1 develop
    git checkout master
    git merge --no-edit --no-ff release/$1
    git tag -a -m '' $1
    git branch -d release/$1
}
