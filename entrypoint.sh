#!/bin/bash
export ADS_HOME=/custom/packages/apacheds
rm -rf /custom/packages/apacheds/instances/default/cache/*
rm -rf /custom/packages/apacheds/instances/default/log/*
rm -rf /custom/packages/apacheds/instances/default/run/.shut*
/custom/packages/apacheds/bin/apacheds.sh default run
