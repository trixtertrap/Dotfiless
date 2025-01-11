#!/bin/bash

BACKLIGHT_PATH="/sys/class/backlight/amdgpu_bl2"
BRIGHTNESS_FILE="$BACKLIGHT_PATH/brightness"
MAX_BRIGHTNESS_FILE="$BACKLIGHT_PATH/max_brightness"

# Get current brightness and max brightness
current_brightness=$(cat "$BRIGHTNESS_FILE")
max_brightness=$(cat "$MAX_BRIGHTNESS_FILE")

# Calculate the adjustment step
step=$((max_brightness / 10))

case $1 in
  up)
    new_brightness=$((current_brightness + step))
    if [ "$new_brightness" -gt "$max_brightness" ]; then
      new_brightness=$max_brightness
    fi
    ;;
  down)
    new_brightness=$((current_brightness - step))
    if [ "$new_brightness" -lt 0 ]; then
      new_brightness=0
    fi
    ;;
  *)
    echo "Usage: $0 {up|down}"
    exit 1
    ;;
esac

# Set the new brightness
echo "$new_brightness" | sudo tee "$BRIGHTNESS_FILE" > /dev/null

