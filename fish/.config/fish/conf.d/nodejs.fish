set -x PATH /opt/nodejs/bin $PATH
set -x NPM_CONFIG_USERCONFIG ~/.config/npm/npmrc
set -x CAPACITOR_ANDROID_STUDIO_PATH /opt/android-studio/bin/studio.sh
# set -x NODE_OPTIONS "--openssl-legacy-provider"

# pnpm
set -gx PNPM_HOME ~/.local/share/pnpm
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# fnm
set FNM_PATH ~/.local/share/fnm
if [ -d "$FNM_PATH" ]
  set PATH "$FNM_PATH" $PATH
  fnm env --use-on-cd --shell fish | source
end
