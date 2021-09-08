#!/usr/bin/env bash

# seconds
poll_interval=4
interface=$1

if [[ -z ${interface} ]]; then
    echo "ERROR: no interface specified"
    echo
    echo "usage: $0 <interface>"
    echo "  Available /sys/class/net interfaces: "
    cd /sys/class/net
    printf "    - %s\n" *
    exit 1
fi

# pick first wlan-looking interface
if [[ ${interface} == auto ]]; then
    cd /sys/class/net
    set -- w*
    interface="$1"
fi

get_if_metric() {
    local metric=$1
    cat "/sys/class/net/${interface}/statistics/${metric}"
}

get_rx_bytes() {
    get_if_metric rx_bytes
}

get_tx_bytes() {
    get_if_metric tx_bytes
}

pp_bytes() {
    local bytes=$1
    numfmt --to=iec-i --suffix=B "${bytes}"
}

rx_prev=$(get_rx_bytes)
tx_prev=$(get_tx_bytes)

while :
do
    rx=$(get_rx_bytes)
    tx=$(get_tx_bytes)

    echo $(pp_bytes $(( ( rx - rx_prev ) / poll_interval ))) $(pp_bytes $(( ( tx - tx_prev ) / poll_interval )))

    rx_prev=${rx}
    tx_prev=${tx}
    sleep "${poll_interval}"
done
