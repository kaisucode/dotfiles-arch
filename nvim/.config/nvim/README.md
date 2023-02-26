

## Install Instructions

- `sudo apt install python3-neovim`
- Install vim plug
- Install silver surfer
- `sudo apt install fzf`
- In zshrc, set fzf to use silver surfer

```bash
alias v="nvim"
alias vi="nvim"
alias vif='nvim $(fzf)'
export FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules -g ""'
```


- go to init.vim, source %
- set up virtualenv

```
virtualenv env
source env/bin/activate
pip install -r requirements.txt
```

- run `:UpdateRemotePlugins` for deoplete

- install nerdfont icons for terminal


### Notes

- Using a virtualenv, redirecting to python binary inside of `env` instead of system-wide python, easier for dependencies
- rebound `enter` to open markdown links -> `ctrl-b` inside the code of the mdnav plugin

