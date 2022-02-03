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
