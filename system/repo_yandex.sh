#!/bin/bash

change_repo_mirror_to_yandex()
{
    repo_conf=sources.list
    repo_path=/etc/apt
    tmp_repo=/tmp/new_repo.list

    sed -e 's/us\.archive\.ubuntu\.com/mirror.yandex.ru/g' $repo_path/$repo_conf > $tmp_repo
    mv -v $tmp_repo $repo_path/$repo_conf
}

change_repo_mirror_to_yandex