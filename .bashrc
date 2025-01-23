# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#complete -cf sudo
complete -cf tldr

export EDITOR=hx
export BROWSER=librewolf
export MOZ_ENABLE_WAYLAND=1
export XDG_CONFIG_HOME=$HOME/.config
export PATH=$HOME/go/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH

. "/home/void/.deno/env"

eval "$(starship init bash)"

alias sudo='sudo -E'
alias ls='ls -a --color=auto'
#PS1='[\u@\h \W]\$ '
