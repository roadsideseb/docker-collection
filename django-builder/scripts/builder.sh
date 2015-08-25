#!/bin/bash
set -uex

app_dir="/app"
venv_dir="/venv"
static_dir="/static"

setup_venv () {
    virtualenv /venv
    set +ue
    . /venv/bin/activate
    set -ue
}

install_requirements () {
    pip install -U pip 
    pip install -r ${app_dir}/requirements.txt
}

build_assets () {
    pushd ${app_dir}
    python manage.py compress -f
    python manage.py collectstatic --noinput 
    popd
}


setup_venv
install_requirements
build_assets
