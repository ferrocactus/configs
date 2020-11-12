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

#plugins=(... docker docker-compose)

PS1="%{$fg[green]%}%n%{$reset_color%} %{$fg[yellow]%}%2~ %{$reset_color%}% "
autoload -U colors && colors

export EDITOR='vim'
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/opt/cuda/bin:~/scripts:~/.gem/ruby/2.7.0/bin
export LD_LIBRARY_PATH=/opt/cuda/lib64 #CUDA

alias ls='ls --color=auto'
alias c='clear'
alias vi='vim'
alias im='viewnior'
alias smount='sudo mount -o gid=users,fmask=113,dmask=002'
alias isomount='sudo mount -o loop'
alias pdf='qpdfview'
alias pac='pacman'
alias pacqi='pacman -Qi'
alias pacq='pacman -Q'
alias pacs='sudo pacman -S'
alias pacu='sudo pacman -U'
alias pacr='sudo pacman -R'
alias pacrs='sudo pacman -Rs'
alias pacsyu='sudo pacman -Syu'
alias ga='git add *'
alias gst='git status'
alias gc='git commit -m'
alias gp='git push -u origin master'
alias jup='jupyter notebook'
alias sven='source ./venv/bin/activate'
alias spy8='source ~/code/py3.8/bin/activate'
alias spy7='source ~/code/py3.7/bin/activate'
alias spy5='source ~/code/py3.5/bin/activate'
alias spy2='source ~/code/py2/bin/activate'
alias jup8='spy8 && jup'
alias jup7='spy7 && jup'
alias jup5='spy5 && jup'
alias R='R -q'
alias cd.='cd ..'
alias del='mv -t ~/.local/share/Trash/files'
alias sudodel='sudo mv -t ~/.local/share/Trash/files'
alias cltex='mv *.out *.aux *.fls *.log *.fdb_latexmk *.synctex.gz ~/.local/share/Trash/files/'
alias cltrash='rm -rf ~/.local/share/Trash/files/* && rm -rf ~/.local/share/Trash/info/* && rm -rf ~/.local/share/Trash/files/.* && rm -rf ~/Floatzel/.trash/*'
alias sudocltrash='sudo rm -rf ~/.local/share/Trash/files/* && sudo rm -rf ~/.local/share/Trash/info/* && sudo rm -rf ~/.local/share/Trash/files/.*'
alias matlab-cli='matlab -nodisplay -nojvm -nosplash'
alias i3lock='lock'
alias eu='function _buff(){g++ $1.cpp && ./a.out};_buff'
alias new='function _buff(){cp ~/code/cpp/Codeforces/template.cpp $1.cpp; vim $1.cpp;};_buff'
alias dok='function _buff(){docker run -it --rm -v $1:/home/dzekrom/mounted:rw --gpus all};_buff'
alias dokjup='function _buff(){docker run -it --rm -v $1:/home/dzekrom/mounted:rw --gpus all -p 8888:8888 tf jupyter notebook --ip=0.0.0.0 --no-browser};_buff'
alias docell='docker run -p 23123:23123 --cpus="4" -it euxhen/cellar /bin/bash'
alias docls='docker container ls'
alias cmu='cd ~/CMU'
alias fall='cd ~/CMU/Fall2020'
alias cell='cd ~/Floatzel/cellar'
alias cmuvpn='sudo openconnect vpn.cmu.edu'
alias cv='cd ~/CMU/Fall2020/Convex\ Optimization/HW/HW5'
alias pgm='cd ~/CMU/Fall2020/PGM/Project'
alias phd='cd ~/Documents/PhD'
alias f='cd ~/Floatzel'
alias fdel='mv -t ~/Floatzel/.trash'

#export PYTHONSTARTUP="/home/zekrom/scripts/pystartup"
# Ruby
export GEM_HOME="~/.gem/ruby/2.7.0/gems"
eval $(thefuck --alias)

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
