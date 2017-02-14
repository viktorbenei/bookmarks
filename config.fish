# ~/.config/fish/config.fish

set -x GOROOT $HOME/.bitrise/toolkits/go/inst/go
set -x GOPATH $HOME/develop/go
set -x PATH $GOROOT/bin $PATH
set -x PATH $GOPATH/bin $PATH
