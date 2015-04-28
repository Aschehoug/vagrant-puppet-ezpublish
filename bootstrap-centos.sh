#!/bin/bash

if [ ! -e ~/.bootstrap-vagrant ]; then
    # Update sources
    yum update -y

    touch ~/.bootstrap-vagrant
fi
