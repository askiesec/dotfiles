 #!/usr/bin/env bash

BT_DEV=$(bluetoothctl show | grep "Powered" | awk '{print $2}')

case "$1" in
  --toggle)
    if [ "$BT_DEV" = "yes" ]; then
      bluetoothctl power off
    else
      bluetoothctl power on
    fi
    ;;
  --connect)
    DEVICE=$(bluetoothctl devices Paired | head -n1 | awk '{print $2}')
    [ -n "$DEVICE" ] && bluetoothctl connect "$DEVICE"
    ;;
  --disconnect)
    DEVICE=$(bluetoothctl devices Connected | head -n1 | awk '{print $2}')
    [ -n "$DEVICE" ] && bluetoothctl disconnect "$DEVICE"
    ;;
  --open-gui)
    blueman-manager &
    ;;
  *)
    if [ "$BT_DEV" != "yes" ]; then
      echo "BT OFF"
      exit 0
    fi

    CONNECTED=$(bluetoothctl devices Connected | head -n1)
    if [ -n "$CONNECTED" ]; then
      NAME=$(echo "$CONNECTED" | cut -d' ' -f3-)
      echo "BT $NAME"
    else
      echo "BT ON"
    fi
    ;;
esac
