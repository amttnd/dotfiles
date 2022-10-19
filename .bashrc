source /usr/share/doc/mcfly/mcfly.bash

export PATH=$PATH:$HOME/.local/bin
eval "$(oh-my-posh init bash --config ~/.poshthemes/dracula.omp.json)"

alias ls="exa --all --long --icons --git --git-ignore --sort name --color=always"
alias cat="bat --theme Dracula"
