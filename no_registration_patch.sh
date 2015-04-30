#!/bin/bash
(
cd /var/www/default
wget -qO no_reg.patch https://raw.githubusercontent.com/Aschehoug/ez5-no-reg/master/ezpublish5_community_project-2014.07.0-gpl-full-no_registration.patch
patch -p2 < no_reg.patch
)
