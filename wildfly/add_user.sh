#!/bin/bash

if [[ -n $ADMIN_USERNAME ]]  && [[ -n $ADMIN_PASSWORD ]]; then
  $WILDFLY_HOME/bin/add-user.sh $ADMIN_USERNAME $ADMIN_PASSWORD --silent
fi
