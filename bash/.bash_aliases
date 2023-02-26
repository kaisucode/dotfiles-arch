
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Usage:
# wal-tile "~/Pictures/wallpaper.png"
wal-tile() 
{
	wal -n -i "$@"
	feh --bg-tile "$(< "${HOME}/.cache/wal/wal")"
}

alias vi="vim"
alias l="clear"
alias sl="ls"
alias la="ls -a"
alias ll="ls -l"
alias q=exit

mkcdir ()
{
  mkdir -p -- "$1" &&
    cd -P -- "$1"
}  

alias gi="git init"
alias gs="git status"
alias ga="git add --all -v"
alias gc="git commit"
alias gca="git commit --amend"
alias gcl="git clone"
alias gco="git checkout"
alias gcom="git checkout master"
alias gl="git log --graph --all --oneline"
alias gb="git branch"
alias gd="git diff"
alias gpom="git push origin master"
alias gpuom="git pull origin master"
alias grao="git remote add origin"


alias python=python3
alias ve="virtualenv env"
alias ave="source/bin/activate"
alias dve="deactivate"

