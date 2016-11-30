#!/bin/sh -eux

# create /etc/fuel/astute.yaml
fuelmenu -i eth0 -s

#add experimental and advanced features
ASTUTE_YAML=/etc/fuel/astute.yaml

sed -i '/FEATURE_GROUPS/a - "experimental"' $ASTUTE_YAML
sed -i '/FEATURE_GROUPS/a - "advanced"' $ASTUTE_YAML
