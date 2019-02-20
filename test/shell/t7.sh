#!/bin/bash -e

# run empty graph
$timeout --kill-after=360s 300s "$MGMT" run --tmp-prefix --no-pgp empty &
pid=$!
sleep 10s	# let it converge
$(sleep 3s && killall -SIGINT mgmt)&	# send ^C to exit mgmt
wait $pid	# get exit status
exit $?
