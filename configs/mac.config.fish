# ~/.config/fish/config.fish
# ln -s (pwd)/mac.config.fish $HOME/.config/fish/config.fish
# or source /path/to/mac.config.fish in ~/.config/fish/config.fish

# fish configs
# bobthefish theme configs:
set -g theme_display_user no
set -g theme_display_hostname no
set -g theme_display_ruby no
set -g theme_display_node no

# brew
set -x PATH /opt/homebrew/bin $PATH

# Go
# Add go bin dir to PATH
set -x PATH $HOME/go/bin $PATH

# asdf
source /opt/homebrew/opt/asdf/libexec/asdf.fish

# Android / Java
set -x JAVA_HOME '/Applications/Android Studio.app/Contents/jbr/Contents/Home'
set -x ANDROID_HOME "$HOME/Library/Android/sdk"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.fish.inc" ]; . "$HOME/google-cloud-sdk/path.fish.inc"; end

# flutter
if [ -d $HOME/develop/flutter/bin ]
    set -x PATH $HOME/develop/flutter/bin $PATH
end

# --- Aliases ---
alias gobr="go build -o /tmp/bin ; and /tmp/bin"
alias colima-start="colima start --cpu 4 --memory 8 ; and colima list"
alias gitlog-details="git log --graph --decorate --all"
alias gitlog-graph="git log --graph --decorate --all --oneline"
alias gradle-clean="rm -rf .gradle build"
# ---------------
