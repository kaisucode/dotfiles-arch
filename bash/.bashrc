# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

(cat ~/.cache/wal/sequences &)

LS_COLORS=$LS_COLORS:'di=0;94:fi=37' ; export LS_COLORS

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

