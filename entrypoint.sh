#!/bin/sh -l

cf add-plugin-repo CF-Community https://plugins.cloudfoundry.org
cf install-plugin https://github.com/cloudfoundry-incubator/multiapps-cli-plugin/releases/latest/download/multiapps-plugin.linux32 -f

cf login -a "$INPUT_CF_API" -u "$INPUT_CF_USER" -p "$INPUT_CF_PWD" -o "$INPUT_CF_ORG" -s "$INPUT_CF_SPACE"

sh -c "cf $*"