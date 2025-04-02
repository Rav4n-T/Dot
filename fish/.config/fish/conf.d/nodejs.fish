set -x PATH /opt/nodejs/bin $PATH
set -x NPM_CONFIG_USERCONFIG ~/.config/npm/npmrc
set -x CAPACITOR_ANDROID_STUDIO_PATH /opt/android-studio/bin/studio.sh
# set -x NODE_OPTIONS "--openssl-legacy-provider"

# pnpm
set -gx PNPM_HOME "/home/rav4n/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

