#!/usr/bin/env bash

# Turn chacon device on/off

pg_chacon_turn () {
    # $1: action [on|off]
    # $2: received order
    local -r order="$(jv_sanitize "$2")"
  while read device; do
    local sdevice="$(jv_sanitize "$device" ".*")"
    if [[ "$order" =~ .*$sdevice.* ]]; then
      local address="$(echo $pg_chacon_config | jq -r ".devices[] | select(.name==\"$device\") | .address")"
      local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
        say "$(pg_chacon_lg "switching_$1" "$2")"
      local cmd="sudo $dir/chacon_send $pg_chacon_gpio_pin $pg_chacon_num $address $1"
	$verbose && jv_debug "$> $cmd"
      eval $cmd | while read line; do jv_debug "$line"; done
        say "$(pg_chacon_lg "switching_done")"
      return $?
    fi
  done <<< "$(echo $pg_chacon_config | jq -r '.devices[].name')"
    say "$(pg_chacon_lg "no_device_matching" "$2")"
  return 1
}
