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

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#ffffff,bg:#161616,hl:#08bdba --color=fg+:#f2f4f8,bg+:#262626,hl+:#3ddbd9 --color=info:#78a9ff,prompt:#33b1ff,pointer:#42be65 --color=marker:#ee5396,spinner:#ff7eb6,header:#be95ff'

. "/home/void/.deno/env"

eval "$(starship init bash)"

alias sudo='sudo -E'
alias ls='ls -a --color=auto'
#PS1='[\u@\h \W]\$ '
