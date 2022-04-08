# ~/.config/fish/config.fish
# ln -s /path/to/original /path/to/link
# or source /path/to/config.fish in ~/.config/fish/config.fish

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/viktorbenei/google-cloud-sdk/path.fish.inc' ]
    . '/Users/viktorbenei/google-cloud-sdk/path.fish.inc'
end

# flutter
if [ -d $HOME/develop/flutter/bin ]
    set -x PATH $HOME/develop/flutter/bin $PATH
end

# --- Aliases ---
alias gobr="go build -o /tmp/bin ; and /tmp/bin"
# ---------------
