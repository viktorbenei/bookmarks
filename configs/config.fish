# ~/.config/fish/config.fish

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
if [ -f '/Users/viktorbenei/google-cloud-sdk/path.fish.inc' ]; . '/Users/viktorbenei/google-cloud-sdk/path.fish.inc'; end

# flutter
if [ -d $HOME/develop/flutter/bin ]; set -x PATH $HOME/develop/flutter/bin $PATH ; end


