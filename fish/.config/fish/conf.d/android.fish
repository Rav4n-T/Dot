set -x IONIC_CONFIG_DIRECTORY ~/.config/ionic
set -x ANDROID_HOME ~/.local/share/android/Sdk
set -x ANDROID_SDK_ROOT ~/.local/share/android/Sdk
set -x GRADLE_USER_HOME ~/.local/share/android/gradle
set -x ANDROID_USER_HOME ~/.local/share/android/android
set -x ANDROID_AVD_HOME ~/.local/share/android/android/avd
set -x JAVA_HOME /opt/android-studio/jbr

set -x PATH $JAVA_HOME/bin $PATH
set -x PATH $ANDROID_HOME/platform-tools $PATH
set -x PATH $ANDROID_HOME/tools $PATH
set -x PATH $ANDROID_HOME/tools/bin $PATH
set -x PATH $ANDROID_HOME/build-tools/34.0.0 $PATH

