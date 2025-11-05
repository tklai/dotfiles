#!/usr/bin/env bash

set -xe

virt=(
    virt-manager
)

sudo dnf install ${virt[@]}
