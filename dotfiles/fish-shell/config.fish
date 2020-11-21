# Setup autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# Load rbenv automatically
status --is-interactive; and source (rbenv init -|psub)

# Add global rbenv ruby to PATH
set PATH $HOME/.gem/ruby/2.7.0/bin $PATH
