#!/bin/sh

# start SSH tunnel (will keep retrying if can't connect, and handle drops)
AUTOSSH_POLL=60 autossh -M20000 -N -f -o "PubkeyAuthentication=yes" -o "PasswordAuthentication=no" teslapi@seattle.rik.systems -R 2210:localhost:22 &

# monitor for network change
/root/bin/rik/detect-network-change.sh &
