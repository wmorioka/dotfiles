# historyから重複を省く
export HISTCONTROL=ignoreboth
PATH=/usr/local/opt/ruby/bin:/usr/local/bin:/usr/local/php5/bin:$PATH:/usr/local/sbin:$HOME/4cast/bin:$HOME/.nodebrew/current/bin:$GOPATH/bin
export PATH

PS1="\u@\h \W\$ "

alias ls='ls -p'
alias l='ls -Gp'
alias ll='ls -lGp'
alias la='ls -aGp'
alias lla='ls -laGp'
alias grep='grep --color=auto'
alias grepc='\grep -v -e "^\s*#" -e "^\s*$"'
alias pwdc='pwd | pbcopy && pwd && echo copied to clipboard!'
alias diff='colordiff'
alias up='cd ..'

alias dns='nslookup'

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
  PS1="\u@\h \W\$(__git_ps1)\$ "
fi

source ~/bin/git-completion.bash

# use GNU commands
# brew install coreutils
brew_prefix=`brew --prefix`
alias base64="$brew_prefix/bin/gbase64"
alias basename="$brew_prefix/bin/gbasename"
alias cat="$brew_prefix/bin/gcat"
alias chcon="$brew_prefix/bin/gchcon"
alias chgrp="$brew_prefix/bin/gchgrp"
alias chmod="$brew_prefix/bin/gchmod"
alias chown="$brew_prefix/bin/gchown"
alias date="$brew_prefix/bin/gdate"

# go
export GOPATH=$HOME

# 「LC_CTYPE: cannot change locale (UTF-8): そのようなファイルやディレクトリはありません」が出たときの対処法
export LC_CTYPE="ja_JP.UTF-8"

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "$HOME/.gvm/bin/gvm-init.sh" ]] && source "$HOME/.gvm/bin/gvm-init.sh"
