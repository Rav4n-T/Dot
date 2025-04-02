#!/bin/bash

export PATH="/opt/nodejs/bin:$PATH"
export NPM_CONFIG_USERCONFIG="$HOME/.config/npm/npmrc"
export CAPACITOR_ANDROID_STUDIO_PATH="/opt/android-studio/bin/studio.sh"
# export NODE_OPTIONS="--openssl-legacy-provider"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
if [[ ! "$PATH" =~ "$PNPM_HOME" ]]; then
  export PATH="$PNPM_HOME:$PATH"
fi
# pnpm end

# fnm
export FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --use-on-cd --shell bash)"
fi


