#!/bin/sh

. "./check_id.sh"

TARGET_DIR="$HOME/bin"

I3_CONFIG_FILE="$HOME/.config/i3/config"

I3_SHORTCUT='$mod+p'
I3_SELECTION_SHORTCUT='$mod+Shift+p'

I3_INSTALLER_ID="screenshot auto-installation"
I3_CONFIG="\n# $I3_INSTALLER_ID\nbindsym $I3_SHORTCUT exec screenshot\nbindsym --release $I3_SELECTION_SHORTCUT exec screenshot --selection"

echo "Installing screenshot dependencies..." \
 && sudo apt install giblib1 giblib-dev scrot \
 && echo "Creating target directory: '$TARGET_DIR'..." \
 && mkdir -p $TARGET_DIR \
 && echo "Copying screenshot script" \
 && cp ../scripts/screenshot $TARGET_DIR \
 && echo "Setting up i3 shortcut to $I3_SHORTCUT and $I3_SELECTION_SHORTCUT with selection" \
 && (check_id "$I3_INSTALLER_ID" "$I3_CONFIG_FILE" \
	&& echo "Already configured i3" \
	|| echo "$I3_CONFIG" >> "$I3_CONFIG_FILE") \
 && echo "Done"
