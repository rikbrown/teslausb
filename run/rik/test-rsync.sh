#!/bin/bash -eu

source /root/.teslaCamRsyncConfig

touch /tmp/test
rsync --rsync-path=/bin/rsync -auvh /tmp/test "$user@$server:$path"