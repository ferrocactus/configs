export ZSH="/home/zekrom/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

# User configuration
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory
setopt hist_ignore_all_dups
unsetopt share_history
unsetopt autocd beep extendedglob nomatch notify
bindkey -e
zstyle :compinstall filename '/home/zekrom/.zshrc'

autoload -Uz compinit
compinit

PS1="%{$fg[green]%}%n%{$reset_color%} %{$fg[yellow]%}%2~ %{$reset_color%}% "
autoload -U colors && colors

export EDITOR='vim'
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:~/scripts

alias ls='ls --color=auto'
alias c='clear'
alias category='vim ~/AUBG/Spring2019/CategoryTheory/Notes/notes.tex'
alias vi='vim'
alias im='viewnior'
alias pac='pacman'
alias pacqi='pacman -Qi'
alias pacq='pacman -Q'
alias pacs='sudo pacman -S'
alias pacu='sudo pacman -U'
alias pacr='sudo pacman -R'
alias pacrs='sudo pacman -Rs'
alias pacsyu='sudo pacman -Syu'
alias cd.='cd ..'
alias del='mv -t ~/.local/share/Trash/files'
alias sudodel='sudo mv -t ~/.local/share/Trash/files'
alias cltrash='rm -rf ~/.local/share/Trash/files/* && rm -rf ~/.local/share/Trash/info/* && rm -rf ~/.local/share/Trash/files/.*'
alias sudocltrash='sudo rm -rf ~/.local/share/Trash/files/* && sudo rm -rf ~/.local/share/Trash/info/* && sudo rm -rf ~/.local/share/Trash/files/.*'
alias matlab-cli='matlab -nodisplay -nojvm -nosplash'
alias aubg='cd ~/AUBG/Spring2019/'
alias i3lock='lock'
alias msfconsole='msfconsole --quiet'
alias eu='function _buff(){g++ $1.cpp && ./a.out};_buff' 
alias new='function _buff(){cp ~/code/cpp/Codeforces/template.cpp $1.cpp; vim $1.cpp;};_buff'

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
