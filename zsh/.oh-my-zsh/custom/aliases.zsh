
# --- Basic Utilities

alias sudo="nocorrect sudo "	# Don't show command again and ask for confirmation
alias q="exit"
alias l="clear"
alias ll="ls -l"
alias la="ls -a"
alias sl="ls"

alias chx='chmod +x'


# --- Directories ---

alias mkdir="mkdir -p"
mkcdir()
{
	mkdir -p -- "$1" &&
		cd -P -- "$1"
}

flag()
{
	ln -s $PWD /Users/kevinhsu/quickAccess/
}

# fd - cd to selected directory with fzf
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

export FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules -g ""'

alias tree="tree -I 'node_modules|env|venv|.git'"

# cd
alias gcd='gcdFunc'
gcdFunc() {
	cd $(git rev-parse --show-toplevel)
}

# go to innermost directory if all subdirectories only have one file
# useful for java packages
function chpwd() {
		files=$(ls -A | wc -l)
		num_of_files=$(echo $files | xargs)

		if [[ $num_of_files = "1" ]]; then
        zmodload zsh/parameter
        if [[ "cd .." != $history[$HISTCMD] ]]; then
            f=$(ls -A)
            if [[ -d "$f" ]]; then
                cd "$f"
            fi
        fi
    fi
}	  



# create .bak copy of file
bak()
{
	for var in "$@"
	do
		cp "$var"{,.bak}
	done
}

function swapfiles()
{
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE && mv "$2" "$1" && mv $TMPFILE "$2"
}


# --- Vim ---
alias v="nvim"
alias vi="vim"
alias vif='nvim $(fzf)'
alias readme="nvim README.md"
alias swap="cd ~/.local/share/nvim/swap/"

# --- Config sourcing ---
alias szshrc="source ~/.zshrc"
alias zshconf="nvim ~/.oh-my-zsh/custom/aliases.zsh"
alias viconf="nvim ~/.config/nvim/"


# --- Languages ---

# Python
alias python=python3
alias pip=pip3
alias ve="virtualenv env"
alias dve="deactivate"
# alias ave="source env/bin/activate"
ave()
{
	if [ -d "env/" ]; then
		source env/bin/activate
	elif [ -d "venv/" ]; then
		source venv/bin/activate
	fi
}

alias asm="gcc -S -fverbose-asm -O2"
alias g11="g++ --std=c++11"
alias g12="g++-12"
alias g17="g++ --std=c++17"

jrun()
{
	javac "${1}.java" && java "$1"
}

mvn()
{
	# cd $(git rev-parse --show-toplevel)
	if [[ $@ == "site" ]]; then
		command mvn site && open target/site/checkstyle.html
	elif [[ $@ == "package" ]]; then
		command mvn package
	elif [[ $@ == "p" ]]; then
		command mvn package
	elif [[ $@ == "pnt" ]]; then
		command mvn -DskipTests=true package
	else 
		command mvn "$@"
	fi
}

npm() 
{
	if [[ $@ == "ls" ]]; then
		command npm ls --depth=0 --silent
	elif [[ $@ == "ls -g" ]]; then
		command npm ls -g --depth=0 --silent
	elif [[ $@ == 'uninstall' ]]; then
		command npm uninstall `ls -1 node_modules | tr '/\n' ' '`
	else
		command npm "$@"
	fi
}
alias web="python3 -m http.server"
# alias web="browser-sync start --server ."


# --- Wifi/Bluetooth ---
alias bt0="rfkill block bluetooth"
alias bt1="rfkill unblock bluetooth"
alias wf0="nmcli radio wifi off"
alias wf1="nmcli radio wifi on"

# alias myip="ifconfig en0 | awk '$1' == "inet" {print $2}"
# alias myip="ifconfig en0 | awk "$1 == 'inet' {print $2}""
myip()
{
	ifconfig en0 | awk '$1 == "inet" {print $2}'
}
alias whereami="ipconfig getifaddr en0"


# --- Git ---
alias g="git"
alias gap="git apply --reject --whitespace=fix"
alias gi="git init"
alias gs="git status"
alias ga="git add --all -v"
alias gc="git commit"
alias gic="git commit -m 'Initial commit'"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gcl="git clone"
alias gco="git checkout "
alias gcom="git checkout master"
alias gcoma="git checkout main"
alias gm="git merge "
alias gl="git log --graph --all --oneline"
alias gl="git -c color.ui=auto log --graph --pretty=tformat:'%C(yellow)%h%Creset}%Cgreen(%ar)%Creset}%C(bold blue)<%an>%Creset} %s' -100|  column -s '}' -t | less"
alias gla="git -c color.ui=auto log --graph --all --pretty=tformat:'%C(yellow)%h%Creset}%Cgreen(%ar)%Creset}%C(bold blue)<%an>%Creset} %s' -100|  column -s '}' -t | less"
alias gk="gitk"
alias gka="gitk --all"
alias gb="git branch"
alias gd="git diff"
alias gpo="git push origin"
alias gpom="git push origin master"
alias gpoma="git push origin main"
alias gpuom="git pull origin master"
alias gpuoma="git pull origin main"
alias grao="git remote add origin"
alias grso="git remote show origin"
alias gpao="git push --all origin"


# --- Misc ---

export CHROME_BIN='/usr/bin/chromium'

# https://github.com/julienXX/terminal-notifier
alias notifyDone='tput bel; terminal-notifier -title "Terminal" -message "Done with task! Exit status: $?"' -activate com.apple.Terminal

# mpg123
alias m="mpg123 -C"
alias ml="mpg123 --loop -1"
alias ma="mpg123 -C@"


# Extract Files
extract() {
 if [ -f $1 ] ; then
     case $1 in
         *.tar.bz2)   tar xvjf $1    ;;
         *.tar.gz)    tar xvzf $1    ;;
         *.tar.xz)    tar xvJf $1    ;;
         *.bz2)       bunzip2 $1     ;;
         *.rar)       unrar x $1     ;;
         *.gz)        gunzip $1      ;;
         *.tar)       tar xvf $1     ;;
         *.tbz2)      tar xvjf $1    ;;
         *.tgz)       tar xvzf $1    ;;
         *.zip)       unzip $1       ;;
         *.Z)         uncompress $1  ;;
         *.7z)        7z x $1        ;;
         *.xz)        unxz $1        ;;
         *.exe)       cabextract $1  ;;
         *)           echo "\`$1': unrecognized file compression" ;;
     esac
 else
     echo "\`$1' is not a valid file"
 fi
}


