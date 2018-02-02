#!/bin/bash

set -x

test $DOMAIN1
test $HOST1
test $DOMAIN2
test $HOST2
test $DOMAIN3
test $HOST3

/bin/confd -onetime -backend env
supervisorctl restart haproxy
