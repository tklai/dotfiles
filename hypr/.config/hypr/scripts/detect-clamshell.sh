#!/usr/bin/env bash

# --- CONFIGURATION ---
LAPTOP_DISPLAY="eDP-1"
# File to store the configuration state
# STATE_FILE="/tmp/hypr_laptop_monitor_state"

# --- LOGIC ---

if grep -q "closed" /proc/acpi/button/lid/LID*/state; then
    # =========================
    #       LID CLOSED
    # =========================

    MOUNT_COUNT=$(hyprctl monitors | grep "Monitor" | wc -l)

    if [ "$MOUNT_COUNT" -gt 1 ]; then
        # CASE 1: Docked (External Monitor exists)

        # # 1. CAPTURE CURRENT STATE
        # # We use jq to find the laptop display and format it into a string:
        # # "eDP-1, 1920x1200@60, 0x0, 1"
        # CURRENT_CONF=$(hyprctl monitors -j | jq -r --arg NAME "$LAPTOP_DISPLAY" '.[] | select(.name == $NAME) | "\(.name), \(.width)x\(.height)@\(.refreshRate), \(.x)x\(.y), \(.scale)"')
        #
        # # Only save if we successfully got a string (monitor was actually active)
        # if [ -n "$CURRENT_CONF" ]; then
        #     echo "$CURRENT_CONF" > "$STATE_FILE"
        # fi
        #
        # # 2. DISABLE MONITOR
        # hyprctl keyword monitor "$LAPTOP_DISPLAY, disable"

        kanshictl switch clamshell
    else
        # CASE 2: Mobile (No External Monitor)
        # Lock and Sleep
        loginctl lock-session
        systemctl suspend
    fi

else
    # =========================
    #       LID OPENED
    # =========================

    # # Check if we have a saved state file
    # if [ -f "$STATE_FILE" ]; then
    #     # Read the saved config
    #     RESTORE_CONF=$(cat "$STATE_FILE")
    #
    #     # Apply the exact saved configuration
    #     hyprctl keyword monitor "$RESTORE_CONF"
    # # else
    # #     # Fallback: If no file exists (e.g., rebooted while docked), use auto settings
    # #     hyprctl keyword monitor "$LAPTOP_DISPLAY, preferred, auto, 1"
    # fi

    kanshictl switch extended
fi
